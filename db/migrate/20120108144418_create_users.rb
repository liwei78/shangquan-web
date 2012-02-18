class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string   :email
      t.string   :name
      t.string   :salt
      t.string   :encrypted_password
      t.string   :signcode   # used for login, stored in session
      t.string   :verifycode # validate user from email
      t.string   :avatar_file_name
      t.string   :avatar_content_type
      t.integer  :avatar_file_size
      t.datetime :avatar_updated_at

      t.timestamps
    end
    add_index :users, :email, :unique => true
    add_index :users, :signcode, :unique => true
  end
end
