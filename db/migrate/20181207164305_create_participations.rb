class CreateParticipations < ActiveRecord::Migration[5.2]
  def change
    create_table :participations do |t|
      t.integer :group_id, null: false, foreign_key: true
      t.integer :user_id, null: false, foreign_key: true
      t.boolean :is_owner, null: false, default: false

      t.timestamps
    end
  end
end
