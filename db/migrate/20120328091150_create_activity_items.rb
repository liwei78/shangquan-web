class CreateActivityItems < ActiveRecord::Migration
  def change
    create_table :activity_items do |t|
      t.integer :activity_id
      t.integer :item_id

      t.timestamps
    end
  end
end
