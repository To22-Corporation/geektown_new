class ChangeMessageParticipations < ActiveRecord::Migration[5.2]
  def change
    change_column :message_participations, :participation_id, :integer, null: true, foreign_key: true
  end
end
