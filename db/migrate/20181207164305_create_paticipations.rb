class CreatePaticipations < ActiveRecord::Migration[5.2]
  def change
    create_table :paticipations do |t|
      t.integer :group_id, null: false, foreign_key: true
      t.integer :user_id, null: false, foreign_key: true

      t.timestamps
    end
  end
end
