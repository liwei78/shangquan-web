class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :title
      t.string :address
      t.string :telphone
      t.text :intro

      t.timestamps
    end
  end
end
