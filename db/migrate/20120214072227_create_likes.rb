class CreateLikes < ActiveRecord::Migration
  def change
    create_table :likes do |t|
      t.integer :good_id
      t.integer :user_id

      t.timestamps
    end
  end
end
