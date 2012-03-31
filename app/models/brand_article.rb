class BrandArticle < ActiveRecord::Base
  belongs_to :article
  belongs_to :brand
end
