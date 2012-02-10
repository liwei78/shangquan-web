class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.string   :title
      t.string   :schedule
      t.string   :place
      t.string   :address
      t.string   :telphone
      t.string   :office_time
      t.string   :bus_info
      t.string   :poster_file_name
      t.string   :poster_content_type
      t.integer  :poster_file_size
      t.datetime :poster_updated_at
      
      t.text     :content

      t.timestamps
    end
  end
end
