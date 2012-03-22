class Item < ActiveRecord::Base
  has_many :photos, :as => :klass
  belongs_to :brand
  belongs_to :user
  has_many :article_items
  has_many :articles, :through => :article_items
  
  scope :block,    :conditions => ["items.state = ?", 0]
  scope :auditing, :conditions => ["items.state = ?", 1]
  scope :white,    :conditions => ["items.state = ?", 2]
  scope :deleted,  :conditions => ["items.state = ?", 3]
  scope :in_store,  :conditions => ["items.store = ?", true]
  
  
  has_attached_file :poster,
    :styles          => {:original => SITE_SETTINGS["item_original"], :small => ""},
    :convert_options => {:small => SITE_SETTINGS["item_small_covert"]},
    :url             => SITE_SETTINGS["paperclip_url"],
    :path            => SITE_SETTINGS["paperclip_path"],
    :default_url     => "itemnopic.jpg"
  
end
