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
      t.integer  :scores,           :default => 0

      t.string   :avatar_file_name
      t.string   :avatar_content_type
      t.integer  :avatar_file_size
      t.datetime :avatar_updated_at

      t.integer  :promotion,     :default => 10        # 0:black_list  0<normal<20  20:white_list
      t.boolean  :deleted,       :default => false
      t.integer  :role,          :default => 0         # 0:normal普通用户, 1:时尚设计师, 2:company商家用户(专卖店), 3:company商家用户(百货店),  4:brand品牌用户
      t.integer  :upgrade_state, :default => 0         # 0:无, 1:申请中, 2:申请通过, 3:申请拒绝
      t.integer  :star,          :default => 0         # 0:无, 1:认证达人, 2:认证商家
      t.boolean  :todaystar,     :default => false     # 今日达人
      t.boolean  :suggest,       :default => false     # 首页推荐
      t.string   :intro                                # 首页推荐语，管理员填写

      t.timestamps
    end
    add_index :users, :email, :unique => true
    add_index :users, :signcode, :unique => true
  end
end
