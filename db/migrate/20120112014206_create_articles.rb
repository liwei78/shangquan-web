class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string   :article_type
      t.integer  :user_id
      t.string   :title
      t.text     :content
      t.string   :code
      
      t.string   :poster_file_name
      t.string   :poster_content_type
      t.integer  :poster_file_size
      t.datetime :poster_updated_at
      
      t.integer  :likes_count, :default => 0
      
      t.timestamps
    end
    add_index :articles, :user_id
  end
end
