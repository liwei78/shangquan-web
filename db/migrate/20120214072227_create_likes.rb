class CreateLikes < ActiveRecord::Migration
  def change
    create_table :likes do |t|
      t.integer :user_id
      t.integer :article_id
      t.integer :like_type, :default => 0 # 0:like 1:share 2:suggest 3:collect
      t.timestamps
    end
  end
end
