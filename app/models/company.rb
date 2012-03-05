class Company < ActiveRecord::Base
  acts_as_taggable
  validates :title, :presence => true
  has_many :likes, :as => :klass
  has_many :comments, :as => :klass
  
  scope :promote, :conditions => ["companies.resource_type = ?", 1]
  scope :block,   :conditions => ["companies.resource_type = ?", 0]
  scope :white,   :conditions => ["companies.resource_type = ?", 2]
  scope :deleted, :conditions => ["companies.resource_type = ?", 3]
end
