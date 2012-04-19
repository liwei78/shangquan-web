class CreateCoupons < ActiveRecord::Migration
  def change
    create_table :coupons do |t|
      t.integer :archetype_id
      t.text    :content
      t.string  :dateintro

      t.timestamps
    end
  end
end
