class Channel < ActiveRecord::Base

  has_many :brands, :class_name => "Archetype", :conditions => ["archetypes.category_id = ?", 1]
  has_many :archetypes
  has_many :articles

  validates :name,
    :presence => true,
    :length => {:maximum => 16, :minimum => 1}
end
