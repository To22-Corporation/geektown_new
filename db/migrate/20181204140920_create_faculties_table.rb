class CreateFacultiesTable < ActiveRecord::Migration[5.2]
  def change
    create_table :faculties do |t|
      t.string :name
    end
  end
end
