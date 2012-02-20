class CreateGoods < ActiveRecord::Migration
  def change
    create_table :goods do |t|
      t.integer  :user_id
      t.string   :title
      t.decimal  :price, :precision => 8, :scale =>2, :default=>0.00
      t.integer  :brand_id
      t.integer  :likes_count, :default => 0
      t.text     :content
      t.string   :poster_file_name
      t.string   :poster_content_type
      t.integer  :poster_file_size
      t.datetime :poster_updated_at
      t.timestamps
    end
  end
end
