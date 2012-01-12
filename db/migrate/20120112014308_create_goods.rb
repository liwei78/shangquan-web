class CreateGoods < ActiveRecord::Migration
  def change
    create_table :goods do |t|
      t.string :title
      t.text :content

      t.timestamps
    end
  end
end
