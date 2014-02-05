def system_try_and_fail(command)
  Bundler.with_clean_env do
    sh command do |ok, res|
      if !ok
        system_try_and_fail "git checkout master"
        raise "FAILURE: Error running #{command} (Pwd: #{Dir.pwd}, exit status:#{res.exitstatus}). Aborting"
      end
    end
  end
end

namespace :deploy do
  HEROKU_ACCOUNT = "wrburgess"
  MAINLINE_BRANCH = "master"
  STAGING_REMOTE = "rails-api-template"
  PRODUCTION_REMOTE = "rails-api-template"

  def make_git_timestamp
    "#{@env}-deploy-#{Time.now.to_s.gsub(/:/, "-").gsub(/\s/, "-").gsub(/--/, "-")}"
  end

  def check_master_branch
    branches = (`git branch`).split
    branches.each_with_index do |br, i|
      if br == "*" && branches[i+1] != MAINLINE_BRANCH
        raise "DEPLOY FAILED: You are not on #{MAINLINE_BRANCH}, you cannot deploy from other branches."
      end
    end
  end

  def check_pending_changes
    status = `git status`
    raise "DEPLOY FAILED: You cannot deploy with pending changes." if status !~ /nothing to commit/
  end

  def set_heroku_account
    system_try_and_fail "heroku accounts:set #{HEROKU_ACCOUNT}"
    puts "******** Heroku account set to #{HEROKU_ACCOUNT}"
  end

  def run_deploy
    timestamp = make_git_timestamp
    deploy_tag(timestamp) if @strategy == "tag"
    deploy_branch(timestamp) if @strategy == "branch"
  end

  def deploy_tag(timestamp)
    puts "******** Tagging with #{timestamp} for #{@env} deploy"
    system_try_and_fail "git tag #{timestamp}"
    system_try_and_fail "git push origin master --tags"
    puts "******** Tag #{timestamp} pushed to origin"
    system_try_and_fail "git push #{@repo} master -f"
    puts "******** Tag #{timestamp} pushed to heroku: #{@repo}"
  end

  def deploy_branch(timestamp)
    puts "******** Branching with #{timestamp} for #{@env} deploy"
    system_try_and_fail "git checkout -b #{timestamp}"
    system_try_and_fail "git push origin #{timestamp}"
    puts "******** Branch #{timestamp} pushed to origin"
    system_try_and_fail "git push #{@repo} #{timestamp}:master -f"
    puts "******** Branch #{timestamp} pushed to heroku: #{@repo}"
    system_try_and_fail "git checkout master"
  end

  def run_specs
    if ENV["DEPLOY_WITHOUT_SPECS"] == "true"
      puts "******** Skipping specs"
      return
    end
    puts "******** Running specs"
    system_try_and_fail "bundle exec rspec spec/ --fail-fast"
    puts "******** All specs passing"
  end

  def migrate_database
    return unless ENV["RUN_MIGRATIONS"] == "true"
    puts "******** Migrating db schema"
    system_try_and_fail "heroku run rake db:migrate --app=#{@repo}"
  end

  def backup_database
    puts "******** Backing up database"
    system_try_and_fail "heroku pgbackups:capture --app=#{@repo} --expire"
  end

  def start_maintenance
    return unless ENV["MAINTENANCE_MODE"] == "true"
    puts "******** Starting maintenance mode"
    system_try_and_fail "heroku maintenance:on --app=#{@repo}"
  end

  def end_maintenance
    return unless ENV["MAINTENANCE_MODE"] == "true"
    puts "******** Stopping maintenance mode"
    system_try_and_fail "heroku maintenance:off --app=#{@repo}"
  end

  def clear_cache
    puts "******** Clearing cache"
    system_try_and_fail "heroku run rake clear_cache --app=#{@repo}"
  end

  def deploy
    check_master_branch
    check_pending_changes
    set_heroku_account
    puts "******** Deploying to #{@env}"
    run_specs
    backup_database
    start_maintenance
    run_deploy
    migrate_database
    clear_cache
    end_maintenance
    puts "******** Successful deployment to #{@env}"
  end

  desc "Deploy to staging"
  task :staging do
    @repo = STAGING_REMOTE
    @strategy = "tag"
    @env = "staging"
    deploy
  end

  desc "Deploy to production"
  task :production do
    @repo = PRODUCTION_REMOTE
    @strategy = "tag"
    @env = "production"
    deploy
  end
end