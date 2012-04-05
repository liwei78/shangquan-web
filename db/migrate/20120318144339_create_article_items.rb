class CreateArticleItems < ActiveRecord::Migration
  def change
    create_table :article_items do |t|
      t.integer :article_id
      t.integer :item_id
      t.string  :item_name
      t.string  :item_brand
      t.string  :item_uniqueid
      t.decimal :price, :precision => 8, :scale =>2, :default=>0.00
      t.string  :buy_place

      t.timestamps
    end
  end
end
