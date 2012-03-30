class CreateChannels < ActiveRecord::Migration
  def change
    create_table :channels do |t|
      t.string  :name
      t.integer :position, :default => 0
      t.timestamps
    end
  end
end
