class InitialSetup < ActiveRecord::Migration
  def change

    create_table "widgets", force: true do |t|
      t.string "title"
      t.timestamps
    end

  end
end