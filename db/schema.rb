ActiveRecord::Schema.define(version: 20140204171626) do

  enable_extension "plpgsql"

  create_table "widgets", force: true do |t|
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
