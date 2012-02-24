class CreateActivityAreas < ActiveRecord::Migration
  def change
    create_table :activity_areas do |t|
      t.string :name
      t.integer :position, :default => 0

      t.timestamps
    end
  end
end
