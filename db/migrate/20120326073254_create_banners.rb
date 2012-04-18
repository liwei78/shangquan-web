class CreateBanners < ActiveRecord::Migration
  def change
    create_table :banners do |t|
      t.string  :title
      t.string  :summary
      t.string  :gourl
      t.integer :position, :default => 0
      t.integer :category, :default => 0 #0:首页滚动 1:滚动右侧4栏 
      
      # 封面
      t.string   :poster_file_name
      t.string   :poster_content_type
      t.integer  :poster_file_size
      t.datetime :poster_updated_at
      
      t.timestamps
    end
  end
end
