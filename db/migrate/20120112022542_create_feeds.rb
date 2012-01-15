class CreateFeeds < ActiveRecord::Migration
  def change
    create_table :feeds do |t|
      t.integer :user_id
      t.integer :klass_id
      t.string  :klass_type
      t.string  :target_url
      t.string  :title
      t.text    :content

      t.timestamps
    end
    add_index :feeds, :user_id
  end
end
