class CreateBrands < ActiveRecord::Migration
  def change
    create_table :brands do |t|
      t.string  :name
      t.integer :channel_id
      t.integer :hot_count,      :default => 0
      t.integer :discount_count, :default => 0
      t.integer :scores_count,   :default => 0       # 评价次数
      t.text    :intro
      
      # logo
      t.string   :logo_file_name
      t.string   :logo_content_type
      t.integer  :logo_file_size
      t.datetime :logo_updated_at
      
      t.boolean  :tmp, :default => false

      t.timestamps
    end
  end
end
