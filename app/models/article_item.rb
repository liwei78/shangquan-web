class ArticleItem < ActiveRecord::Base
  belongs_to :article
  belongs_to :user
  
  validates :name, :presence => true

  scope :is_top, :conditions => ["article_items.top = ?", true]
  
  has_attached_file :poster,
    :styles          => {:original => SITE_SETTINGS["item_original"], :small => ""},
    :convert_options => {:small => SITE_SETTINGS["item_small_covert"]},
    :url             => SITE_SETTINGS["paperclip_url"],
    :path            => SITE_SETTINGS["paperclip_path"],
    :default_url     => "itemnopic.jpg"
end
