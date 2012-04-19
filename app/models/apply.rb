class Apply < ActiveRecord::Base
  belongs_to :user
  belongs_to :archetype
end
