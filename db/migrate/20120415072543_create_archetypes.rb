# encoding: utf-8
class CreateArchetypes < ActiveRecord::Migration
  def change
    create_table :archetypes do |t|
      t.string  :name
      t.integer :channel_id
      t.integer :category_id
      t.integer :area_id
      t.integer :position, :default => 0

      t.integer :hot_count,      :default => 0
      t.integer :likes_count,    :default => 0
      t.integer :shares_count,   :default => 0
      t.integer :comments_count, :default => 0
      t.integer :scores_count,   :default => 0       # 评价次数
      t.text    :intro
      
      # logo
      t.string   :logo_file_name
      t.string   :logo_content_type
      t.integer  :logo_file_size
      t.datetime :logo_updated_at

      t.timestamps
    end
    
  end
end
