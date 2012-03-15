# encoding: utf-8
# 商品信息临时表
# 审核通过后，信息加入内容主体
class CreateItemReports < ActiveRecord::Migration
  def change
    create_table :item_reports do |t|
      t.string   :title
      t.text     :content
      t.integer  :user_id
      t.decimal  :price, :precision => 8, :scale =>2, :default=>0.00
      t.string   :brand_name
      t.integer  :brand_id
      t.timestamps
    end
  end
end
