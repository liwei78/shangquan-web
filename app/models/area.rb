class Area < ActiveRecord::Base
  validates :name, :presence => true
end
