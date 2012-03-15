# encoding: utf-8
# 商品模块
class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.integer  :user_id
      t.string   :unique_id # 货号
      t.string   :title
      t.decimal  :price, :precision => 8, :scale =>2, :default=>0.00
      t.string   :brand_name
      t.integer  :brand_id
      t.text     :content
      t.integer  :state, :default => 1 # 系统内容类型 0:block 1:auditing 2:white 3:deleted
      t.timestamps
    end
  end
end
