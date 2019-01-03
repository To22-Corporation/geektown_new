class ChangeGroupSkills < ActiveRecord::Migration[5.2]
  def change
    change_column :group_skills, :level, :integer, null: false, default: 1, limit: 1
  end
end
