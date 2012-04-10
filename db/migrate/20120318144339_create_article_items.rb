class CreateArticleItems < ActiveRecord::Migration
  def change
    create_table :article_items do |t|
      t.integer :article_id
      t.integer :item_id
      t.string  :category
      t.string  :name
      t.string  :brand
      t.decimal :price, :precision => 8, :scale =>2, :default=>0.00
      t.string  :buy_place
      t.string  :unique_id
      
      # 封面
      t.string   :poster_file_name
      t.string   :poster_content_type
      t.integer  :poster_file_size
      t.datetime :poster_updated_at

      t.timestamps
    end
  end
end
