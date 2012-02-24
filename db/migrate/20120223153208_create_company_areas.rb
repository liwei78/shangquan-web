class CreateCompanyAreas < ActiveRecord::Migration
  def change
    create_table :company_areas do |t|
      t.string :name
      t.integer :position, :default => 0

      t.timestamps
    end
  end
end
