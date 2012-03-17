class Brand < ActiveRecord::Base
  has_many :brand_users
  has_many :users, :through => :brand_users
  scope :tmp, :conditions => ["tmp = ?", true]
  scope :formal, :conditions => ["tmp = ?", false]
end
