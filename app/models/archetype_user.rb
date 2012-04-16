class ArchetypeUser < ActiveRecord::Base
  belongs_to :archetype
  belongs_to :user
end
