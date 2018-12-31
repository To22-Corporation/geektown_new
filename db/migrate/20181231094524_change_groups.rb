class ChangeGroups < ActiveRecord::Migration[5.2]
  def change
    change_column :groups, :limited_number, :integer, null: true
  end
end
