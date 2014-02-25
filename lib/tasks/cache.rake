desc "Clears the rails cache"
task clear_cache: :environment do
  Rails.cache.clear
end