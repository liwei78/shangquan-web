class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.integer  :company_type, :default => 0
      t.string   :company_category
      t.string   :company_area
      t.string   :title
      t.string   :other_title
      t.string   :address
      t.string   :telphone
      t.string   :office_time
      t.string   :bus_info
      t.string   :website
      t.integer  :comments_count, :default => 0
      t.text     :content
      t.integer  :resource_type, :default => 1 # 0:block 1:normal 2:white 3:deleted
      t.timestamps
    end
  end
end
