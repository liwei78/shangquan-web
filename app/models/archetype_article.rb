class ArchetypeArticle < ActiveRecord::Base
  belongs_to :archetype
  belongs_to :article
end
