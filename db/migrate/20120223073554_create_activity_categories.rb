class CreateActivityCategories < ActiveRecord::Migration
  def change
    create_table :activity_categories do |t|
      t.string :name
      t.integer :position, :default => 0
      t.timestamps
    end
  end
end
