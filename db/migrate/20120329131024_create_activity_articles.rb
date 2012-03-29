class CreateActivityArticles < ActiveRecord::Migration
  def change
    create_table :activity_articles do |t|
      t.integer :activity_id
      t.integer :article_id

      t.timestamps
    end
  end
end
