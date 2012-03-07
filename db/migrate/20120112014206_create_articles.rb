class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.integer  :user_id
      t.string   :title
      t.string   :other_title
      t.text     :summary
      t.text     :content
      
      t.string   :code  # video code
      
      t.string   :poster_file_name
      t.string   :poster_content_type
      t.integer  :poster_file_size
      t.datetime :poster_updated_at
      
      t.integer  :likes_count,       :default => 0
      t.integer  :shares_count,      :default => 0
      t.integer  :collections_count, :default => 0
      
      t.integer  :state,          :default => 1   # 0:block, 1:auditing, 2:white, 3:deleted
      t.integer  :comments_count, :default => 0
      t.integer  :source_type,    :default => 0   # 0:user add 1:admin add 2:user audited
      
      # type
      t.boolean  :is_article,  :default => true
      t.boolean  :is_photo,    :default => false
      t.boolean  :is_video,    :default => false
      t.boolean  :is_news,     :default => false
      t.boolean  :is_activity, :default => false
      t.boolean  :is_company,  :default => false
      t.boolean  :is_brand,    :default => false
      t.boolean  :is_good,     :default => false
      t.boolean  :is_groupbuy, :default => false
      
      # activity and company
      t.string   :schedule
      t.string   :place
      t.string   :address
      t.string   :telphone
      t.string   :office_time
      t.string   :bus_info
      t.string   :discount
      t.string   :website

      # brand
      t.string   :brand_name
      t.string   :brand_desc
      
      # groupbuy
      t.string   :groupbuy_desc

      # map info
      t.string   :category
      t.string   :area
      t.string   :province
      t.string   :city
      t.string   :map
      
      # good
      t.decimal  :price, :precision => 8, :scale =>2, :default=>0.00
      
      t.timestamps
    end
    add_index :articles, :user_id
  end
end
