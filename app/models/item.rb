class Item < ActiveRecord::Base
  has_many :photos, :as => :klass
  belongs_to :brand
  belongs_to :user
  
  scope :block,    :conditions => ["articles.state = ?", 0]
  scope :auditing, :conditions => ["articles.state = ?", 1]
  scope :white,    :conditions => ["articles.state = ?", 2]
  scope :deleted,  :conditions => ["articles.state = ?", 3]
  
  has_attached_file :poster,
    :styles          => { :original => SITE_SETTINGS["crop_original"], :small => "" },
    :convert_options => { :small => SITE_SETTINGS["crop_small_covert"] },
    :url             => SITE_SETTINGS["paperclip_url"],
    :path            => SITE_SETTINGS["paperclip_path"],
    :default_url     => "nopic.jpg"
  
end
