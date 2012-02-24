class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.integer  :user_id
      t.integer  :activity_type, :default => 0
      t.string   :activity_category
      t.string   :activity_area
      t.string   :title
      t.string   :schedule
      t.string   :place
      t.string   :address
      t.string   :telphone
      t.string   :office_time
      t.string   :bus_info
      t.string   :discount
      t.string   :website
      t.string   :poster_file_name
      t.string   :poster_content_type
      t.integer  :poster_file_size
      t.datetime :poster_updated_at
      t.integer  :comments_count, :default => 0
      t.text     :content
      t.timestamps
    end
  end
end
