class CreateBrands < ActiveRecord::Migration
  def change
    create_table :brands do |t|
      t.string   :title
      t.integer  :nation
      t.string   :letter
      t.integer  :category_id
      t.string   :poster_file_name
      t.string   :poster_content_type
      t.integer  :poster_file_size
      t.datetime :poster_updated_at

      t.timestamps
    end
  end
end
