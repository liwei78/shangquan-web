class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.integer :ctype, :default => 0
      t.string  :title
      t.string  :other_title
      t.string  :address
      t.string  :telphone
      t.string  :office_time
      t.string  :bus_info
      t.string  :website
      t.text    :content

      t.timestamps
    end
  end
end
