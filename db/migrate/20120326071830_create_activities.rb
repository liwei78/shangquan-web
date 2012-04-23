class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.integer  :user_id
      t.integer  :archetype_id
      t.string   :title
      t.string   :summary
      t.text     :content
      t.string   :opening_date
      t.integer  :status,  :default => 0      # 0:new 1:opening 2:closed
      t.boolean  :suggest, :default => false  # 是否首页推荐
      t.boolean  :top,     :default => false  # 是否首页置顶
      t.integer  :shares_count, :default => 0 # 分享次数

      # 小图标
      t.string   :logo_file_name
      t.string   :logo_content_type
      t.integer  :logo_file_size
      t.datetime :logo_updated_at
      # 封面
      t.string   :poster_file_name
      t.string   :poster_content_type
      t.integer  :poster_file_size
      t.datetime :poster_updated_at

      # map
      t.string   :latitude
      t.string   :longitude

      t.timestamps
    end
  end
end
