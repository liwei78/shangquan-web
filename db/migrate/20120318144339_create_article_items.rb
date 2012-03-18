class CreateArticleItems < ActiveRecord::Migration
  def change
    create_table :article_items do |t|
      t.integer :article_id
      t.integer :item_id

      t.timestamps
    end
  end
end
