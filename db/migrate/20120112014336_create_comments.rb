class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer  :user_id
      t.integer  :klass_id
      t.integer  :klass_type
      t.text     :content
      t.integer  :state, :default => 1   # 0:block, 1:auditing, 2:white, 3:deleted
      t.timestamps
    end
  end
end
