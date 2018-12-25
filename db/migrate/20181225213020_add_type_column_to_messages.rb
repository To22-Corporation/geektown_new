class AddTypeColumnToMessages < ActiveRecord::Migration[5.2]
  def change
    add_column :messages, :type, :integer, default: 0
    add_index :messages, :type
  end
end
