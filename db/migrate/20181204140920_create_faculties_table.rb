class CreateFacultiesTable < ActiveRecord::Migration[5.2]
  def change
    create_table :faculties_tables do |t|
      t.string :name
    end
  end
end
