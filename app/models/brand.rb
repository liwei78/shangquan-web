class Brand < ActiveRecord::Base
  belongs_to :channel
  has_many :brand_users
  has_many :users, :through => :brand_users
  has_many :brand_articles
  has_many :articles, :through => :brand_articles 
  has_many :likes, :as => :klass
  has_many :followers, :through => :likes, :source => :user
  
  scope :tmp, :conditions => ["tmp = ?", true]
  scope :formal, :conditions => ["tmp = ?", false]
  
  validates :name,
    :presence => true,
    :length => {:maximum => 16, :minimum => 1}
  
    
  has_attached_file :logo,
    :styles          => {:original => SITE_SETTINGS["brand_original"], :small => SITE_SETTINGS["brand_small"]},
    :url             => SITE_SETTINGS["paperclip_url"],
    :path            => SITE_SETTINGS["paperclip_path"],
    :default_url     => "brandnopic.jpg"
end
