class CreateDistricts < ActiveRecord::Migration
  def change
    create_table :districts do |t|
      t.integer :area_id
      t.integer :archetype_id

      t.timestamps
    end
  end
end
