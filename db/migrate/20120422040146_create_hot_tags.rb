class CreateHotTags < ActiveRecord::Migration
  def change
    create_table :hot_tags do |t|
      t.string  :name
      t.integer :position, :default => 0

      t.timestamps
    end
  end
end
