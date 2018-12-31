class ChangeGroups < ActiveRecord::Migration[5.2]
  def change
    change_column :groups, :limited_number, :integer, null: true
    change_column :groups, :close_at, :datetime, null: true
    add_column :groups, :is_master, :boolean, null: true, default: false
  end
end
