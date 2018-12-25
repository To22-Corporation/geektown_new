class CreateGroupSkills < ActiveRecord::Migration[5.2]
  def change
    create_table :group_skills do |t|
      t.integer :group_id, null: false, foreign_key: true
      t.integer :skill_id, null: false, foreign_key: true
      t.integer :level, null: false, limit: 1

      t.timestamps
    end
  end
end
