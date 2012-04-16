class CreateReports < ActiveRecord::Migration
  def change
    create_table :reports do |t|
      t.string :report_type
      t.integer :user_id
      t.string :opening_date
      t.text :content
      t.string :info_from

      t.timestamps
    end
  end
end
