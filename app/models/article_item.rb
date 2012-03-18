class ArticleItem < ActiveRecord::Base
  belongs_to :article
  belongs_to :item
end
