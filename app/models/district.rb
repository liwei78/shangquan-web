class District < ActiveRecord::Base
  belongs_to :archetype
  belongs_to :area
end
