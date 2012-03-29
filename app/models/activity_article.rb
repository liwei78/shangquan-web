class ActivityArticle < ActiveRecord::Base
  belongs_to :activity
  belongs_to :article
end
