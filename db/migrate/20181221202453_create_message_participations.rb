class CreateMessageParticipations < ActiveRecord::Migration[5.2]
  def change
    create_table :message_participations do |t|
      t.integer :message_id, null: false, foreign_key: true
      t.integer :participation_id, null: false, foreign_key: true

      t.timestamps
    end

    add_index :message_participations, [:message_id, :participation_id], unique: true
  end
end
