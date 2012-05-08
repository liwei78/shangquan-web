class Archetype < ActiveRecord::Base

  belongs_to :channel
  belongs_to :category
  belongs_to :area

  has_many :archetype_users
  has_many :users, :through => :archetype_users

  has_many :applies
  has_many :owners, :through => :applies, :source => :user

  has_many :archetype_articles
  has_many :articles, :through => :archetype_articles 

  has_many :likes, :as => :klass
  has_many :followers, :through => :likes, :source => :user

  validates :name,
    :presence => true,
    :length => {:maximum => 16, :minimum => 1}
  

  scope :is_brand,   :conditions => ["channel_id = ?", 1]
  scope :is_company, :conditions => ["category_id = ?", 2]
  scope :is_mall,    :conditions => ["category_id = ?", 1]
  scope :is_repast,  :conditions => ["category_id = ?", 4]
  
  # has_many :districts
  # has_many :areas, :through => :districts
  has_many :coupons

  has_many :activities
  
  def has_map?
    self.latitude.present? and self.longitude.present?
  end

  has_attached_file :logo,
    :styles          => {:original => SITE_SETTINGS["archetype_original"]},
    :url             => SITE_SETTINGS["paperclip_url"],
    :path            => SITE_SETTINGS["paperclip_path"],
    :default_url     => "nopic.jpg"
end
