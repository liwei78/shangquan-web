class Area < ActiveRecord::Base
  validates :name, :presence => true
  
  # has_many :districts
  has_many :companies, :class_name => 'Archetype', :conditions => ["archetypes.category_id = ?", 3]
  has_many :malls, :class_name => 'Archetype', :conditions => ["archetypes.category_id = ?", 2]
  has_many :repasts, :class_name => 'Archetype', :conditions => ["archetypes.category_id = ?", 4]
  has_many :b2bs, :class_name => 'Archetype', :conditions => ["archetypes.category_id = ?", 6]

  has_many :articles
  has_many :archetypes
end
