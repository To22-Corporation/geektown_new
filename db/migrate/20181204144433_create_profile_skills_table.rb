class CreateProfileSkillsTable < ActiveRecord::Migration[5.2]
  def change
    create_table :profile_skills do |t|
      t.integer :profile_id, null: false, foreign_key: true
      t.integer :skill_id, null: false, foreign_key: true
      t.integer :level, null: false, limit: 1

      t.timestamps
    end

    add_index :profile_skills, [:profile_id, :skill_id], unique: true
  end
end
