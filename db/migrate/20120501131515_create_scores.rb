class CreateScores < ActiveRecord::Migration
  def change
    create_table :scores do |t|
      t.string  :flag
      t.string  :intro
      t.integer :point, :default => 0

      t.timestamps
    end
  end
end
