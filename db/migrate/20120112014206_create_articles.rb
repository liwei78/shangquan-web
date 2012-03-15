# encoding: utf-8
# 内容信息主体
# 内容聚合来源

class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.integer  :user_id
      t.string   :title
      t.string   :other_title
      t.text     :summary
      t.text     :content
      
      # 视频代码
      t.string   :video_code
      
      # 封面
      t.string   :poster_file_name
      t.string   :poster_content_type
      t.integer  :poster_file_size
      t.datetime :poster_updated_at
      
      # sns信息
      t.integer  :likes_count,       :default => 0
      t.integer  :shares_count,      :default => 0
      t.integer  :collections_count, :default => 0
      t.integer  :comments_count,    :default => 0
      
      # 状态
      t.integer  :state,          :default => 1   # 0:block, 1:auditing, 2:white, 3:deleted
      t.integer  :source_type,    :default => 0   # 来源标示 0:user add 1:admin add 2:user audited
      
      # 内容类型标示
      t.boolean  :is_article,  :default => false
      t.boolean  :is_photo,    :default => false
      t.boolean  :is_video,    :default => false
      t.boolean  :is_news,     :default => false
      t.boolean  :is_activity, :default => false
      t.boolean  :is_company,  :default => false
      t.boolean  :is_brand,    :default => false
      t.boolean  :is_good,     :default => false
      t.boolean  :is_groupbuy, :default => false
      
      # 经营信息
      t.string   :schedule
      t.string   :place
      t.string   :address
      t.string   :telphone
      t.string   :office_time
      t.string   :bus_info
      t.string   :discount
      t.string   :website

      # 品牌信息
      t.string   :brand_name
      t.string   :brand_desc
      
      # 团购描述
      t.string   :groupbuy_desc

      # 地区信息
      t.string   :category
      t.string   :area
      t.string   :province
      t.string   :city
      t.string   :map
      
      # 价格
      t.decimal  :price, :precision => 8, :scale =>2, :default=>0.00
      
      t.timestamps
    end
    add_index :articles, :user_id
  end
end
