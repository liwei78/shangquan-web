class CreateVisits < ActiveRecord::Migration
  def change
    create_table :visits do |t|
      t.integer :klass_id
      t.string :klass_type
      t.integer :user_id
      t.string :user_name

      t.timestamps
    end
  end
end
