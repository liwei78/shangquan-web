class Area < ActiveRecord::Base
  validates :name, :presence => true
  
  has_many :districts
  has_many :companies, :through => :districts, :source => :archetype, :conditions => ["archetypes.category_id = ?", 3]

  has_many :districts
  has_many :malls, :through => :districts, :source => :archetype, :conditions => ["archetypes.category_id = ?", 2]

  has_many :articles
  has_many :archetypes
end
