class Channel < ActiveRecord::Base
  has_many :brands
  validates :name,
    :presence => true,
    :length => {:maximum => 16, :minimum => 1}
end
