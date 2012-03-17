class CreateBrandUsers < ActiveRecord::Migration
  def change
    create_table :brand_users do |t|
      t.integer :user_id
      t.integer :brand_id

      t.timestamps
    end
  end
end
