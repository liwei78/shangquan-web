# encoding: utf-8
class Page < ActiveRecord::Base
  validates :title, :presence => true
  
  def category_name
    ["文档", "资讯", "公告"][self.category_id]
  end
end
