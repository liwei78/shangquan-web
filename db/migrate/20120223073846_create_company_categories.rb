class CreateCompanyCategories < ActiveRecord::Migration
  def change
    create_table :company_categories do |t|
      t.string :name
      t.integer :position, :default => 0
      t.timestamps
    end
  end
end
