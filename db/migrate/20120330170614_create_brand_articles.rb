class CreateBrandArticles < ActiveRecord::Migration
  def change
    create_table :brand_articles do |t|
      t.integer :brand_id
      t.integer :article_id

      t.timestamps
    end
  end
end
