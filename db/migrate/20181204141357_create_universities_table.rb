class CreateUniversitiesTable < ActiveRecord::Migration[5.2]
  def change
    create_table :universities do |t|
      t.string :name
    end
  end
end
