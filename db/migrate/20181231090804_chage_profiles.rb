class ChageProfiles < ActiveRecord::Migration[5.2]
  def change
    #remove_reference :profiles, :university, foreign_key: true
    #remove_reference :profiles, :faculty, foreign_key: true
    #add_column :profiles, :university, :string, null: true
    #add_column :profiles, :faculty, :string, null: true
    add_column :profiles, :comment, :string, null: true
    #add_column :profiles, :grade, :integer, null: true
  end
end
