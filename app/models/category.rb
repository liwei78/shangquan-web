class Category < ActiveRecord::Base
  validates :name, :presence => true
  has_many :category_items
  has_many :items, :through => :category_items
  has_many :archetypes
  def self.top(n=1)
    find(:all, :order => "position asc", :limit => n)
  end
end
