class CreateUniversitiesTable < ActiveRecord::Migration[5.2]
  def change
    create_table :universities_tables do |t|
      t.string :name
    end
  end
end
