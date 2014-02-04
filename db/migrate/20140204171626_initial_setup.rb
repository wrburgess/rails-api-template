class InitialSetup < ActiveRecord::Migration
  def change

    create_table "models", force: true do |t|
      t.string   "string_field"
      t.integer  "number_field"
      t.boolean  "truefalse_field"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
    end

  end
end