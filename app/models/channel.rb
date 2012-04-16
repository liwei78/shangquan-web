class Channel < ActiveRecord::Base

  has_many :brands, :class_name => "Archetype", :conditions => ["archetypes.category_id = ?", 1]

  validates :name,
    :presence => true,
    :length => {:maximum => 16, :minimum => 1}
end
