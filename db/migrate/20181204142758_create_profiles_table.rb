class CreateProfilesTable < ActiveRecord::Migration[5.2]
  def change
    create_table :profiles do |t|
      t.string :name, null: false
      t.references :user, index: true
      t.references :university
      t.references :faculty

      t.timestamps
    end
  end
end
