class CreateProfilesTable < ActiveRecord::Migration[5.2]
  def change
    create_table :profiles do |t|
      t.string :name, null: false
      t.references :user, null: false, foreign_key: true
      t.references :university, null: false, foreign_key: true
      t.references :faculty, null: false, foreign_key: true

      t.timestamps
    end
  end
end
