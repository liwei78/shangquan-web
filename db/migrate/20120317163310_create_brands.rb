class CreateBrands < ActiveRecord::Migration
  def change
    create_table :brands do |t|
      t.string  :name
      t.integer :channel_id
      
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
