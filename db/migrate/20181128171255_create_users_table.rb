class CreateUsersTable < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :email, null: false
      t.string :crypted_password
      t.string :salt
      t.string :remember_me_token, default: nil
      t.datetime :remember_me_token_expires_at, default: nil

      t.index :remember_me_token
      t.timestamps
    end
  end
end
