class CreateShares < ActiveRecord::Migration
  def change
    create_table :shares do |t|
      t.integer :user_id
      t.string  :klass_type
      t.integer :klass_id
      t.timestamps
    end
  end
end
