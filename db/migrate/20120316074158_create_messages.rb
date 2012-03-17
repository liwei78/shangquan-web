class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.integer :user_id
      t.integer :send_by
      t.boolean :sysmsg, :default => false
      t.boolean :top,    :default => false
      t.boolean :read,   :default => false
      t.string  :title
      t.text    :content

      t.timestamps
    end
  end
end
