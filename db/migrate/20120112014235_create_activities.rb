class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.string :title
      t.string :time
      t.string :address
      t.string :telphone
      t.text :content

      t.timestamps
    end
  end
end
