class CreateArticleItems < ActiveRecord::Migration
  def change
    create_table :article_items do |t|
      t.integer  :article_id
      t.integer  :user_id
      t.string   :category
      t.string   :name
      t.string   :brand
      t.decimal  :price, :precision => 8, :scale =>2, :default=>0.00
      t.string   :buy_place
      t.string   :unique_id
      t.boolean  :is_new, :default => false
      t.boolean  :suggest,        :default => false        # 推荐
      t.boolean  :top,            :default => false        # 置顶，用于首页推荐
      t.integer  :likes_count,    :default => 0
      t.integer  :comments_count, :default => 0
      t.integer  :collects_count, :default => 0
      t.boolean  :top,        :default => false
      t.integer  :position,   :default => 0            # 排序，用户首页推荐顺序
      t.string   :summary                              # 摘要
      
      # 封面
      t.string   :poster_file_name
      t.string   :poster_content_type
      t.integer  :poster_file_size
      t.datetime :poster_updated_at

      t.timestamps
    end
  end
end
