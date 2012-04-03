# encoding: utf-8
# 商品模块
class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.integer  :user_id
      t.string   :unique_id # 货号
      t.string   :title
      t.decimal  :price, :precision => 8, :scale =>2, :default=>0.00
      t.integer  :brand_id
      t.text     :content,        :default => ""
      t.integer  :state,          :default => 1 # 系统内容类型 0:block 1:auditing 2:white 3:deleted
      t.boolean  :store,          :default => false
      t.boolean  :suggest,        :default => false        # 推荐
      t.boolean  :top,            :default => false        # 置顶，用于首页推荐
      t.integer  :likes_count,    :default => 0
      t.integer  :comments_count, :default => 0
      t.integer  :collects_count, :default => 0
      t.integer  :position,       :default => 0            # 排序，用户首页推荐顺序
      t.string   :summary                                  # 摘要
      t.string   :buy_place                                # 购买地点
      
      # 封面
      t.string   :poster_file_name
      t.string   :poster_content_type
      t.integer  :poster_file_size
      t.datetime :poster_updated_at
      
      t.timestamps
    end
  end
end
