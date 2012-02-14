class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :klass_id
      t.integer :klass_type
      t.text    :content

      t.timestamps
    end
  end
end
