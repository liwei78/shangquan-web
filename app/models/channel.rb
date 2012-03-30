class Channel < ActiveRecord::Base
  validates :name,
    :presence => true,
    :length => {:maximum => 16, :minimum => 1}
end
