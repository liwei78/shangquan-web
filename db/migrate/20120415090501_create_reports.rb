class CreateReports < ActiveRecord::Migration
  def change
    create_table :reports do |t|
      t.integer :channel_id
      t.integer :category_id
      t.integer :area_id
      t.integer :user_id
      t.string  :opening_date
      t.text    :content
      t.string  :info_from

      t.timestamps
    end
  end
end
