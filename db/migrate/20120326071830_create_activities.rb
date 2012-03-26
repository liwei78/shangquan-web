class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.string :title
      t.string :summary
      t.text   :content
      t.string :opening_date
      t.integer :status, :default => 0 # 0:new 1:opening 2:closed
      # 封面
      t.string   :poster_file_name
      t.string   :poster_content_type
      t.integer  :poster_file_size
      t.datetime :poster_updated_at

      t.timestamps
    end
  end
end
