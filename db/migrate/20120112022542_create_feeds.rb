class CreateFeeds < ActiveRecord::Migration
  def change
    create_table :feeds do |t|
      t.integer :user_id
      t.string  :title
      t.text    :content

      t.timestamps
    end
    add_index :feeds, :user_id
  end
end
