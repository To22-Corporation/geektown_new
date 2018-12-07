class CreateGroups < ActiveRecord::Migration[5.2]
  def change
    create_table :groups do |t|
      t.string :name, null: false, limit: 128
      t.text :description, null: false
      t.datetime :close_at, null: false
      t.unsigned_integer :limited_number, null: false, limit: 2

      t.timestamps
    end
  end
end
