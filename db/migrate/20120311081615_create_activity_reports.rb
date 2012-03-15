# encoding: utf-8
# 活动信息临时表
# 审核通过后，信息加入内容主体
class CreateActivityReports < ActiveRecord::Migration
  def change
    create_table :activity_reports do |t|
      t.string  :title
      t.text    :content
      t.integer :user_id

      t.timestamps
    end
  end
end
