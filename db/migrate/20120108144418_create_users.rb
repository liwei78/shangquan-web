class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string   :email
      t.string   :name
      t.string   :salt
      t.string   :encrypted_password
      t.string   :signcode   # used for login, stored in session
      t.string   :verifycode # validate user from email

      t.integer  :articles_count,   :default => 0
      t.integer  :followers_count,  :default => 0
      t.integer  :followings_count, :default => 0
      t.integer  :favorites_count,  :default => 0

      t.string   :avatar_file_name
      t.string   :avatar_content_type
      t.integer  :avatar_file_size
      t.datetime :avatar_updated_at

      t.integer  :promotion, :default => 10   # 0:black_list  0<normal<20  20:white_list
      t.boolean  :deleted, :default => false

      t.timestamps
    end
    add_index :users, :email, :unique => true
    add_index :users, :signcode, :unique => true
  end
end
