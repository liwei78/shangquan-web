class CreateApplies < ActiveRecord::Migration
  def change
    create_table :applies do |t|
      t.integer :user_id
      t.integer :archetype_id
      t.boolean :passed, :default => false
      t.string  :reason

      t.timestamps
    end
  end
end
