class CreateUsersLog < ActiveRecord::Migration[5.2]
  def change
    create_table :users_logs do |t|
      t.string :email
      t.string :secret_password
      t.string :reset_password
      t.datetime :resettime
      t.datetime :creationaccount

      t.timestamps null:false
    end
      add_index :users, :email,   unique: true
      add_index :users, :reset_password, unique: true
  end
end
