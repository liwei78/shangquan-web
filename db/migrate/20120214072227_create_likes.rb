class CreateLikes < ActiveRecord::Migration
  def change
    create_table :likes do |t|
      t.integer :klass_id
      t.string  :klass_type
      t.integer :user_id
      t.timestamps
    end
  end
end
