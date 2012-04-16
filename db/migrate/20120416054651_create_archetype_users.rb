class CreateArchetypeUsers < ActiveRecord::Migration
  def change
    create_table :archetype_users do |t|
      t.integer :archetype_id
      t.integer :user_id

      t.timestamps
    end
  end
end
