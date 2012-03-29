class Activity < ActiveRecord::Base
  
  has_many :activity_articles
  has_many :articles, :through => :activity_articles
  
  has_many :activity_items
  has_many :items, :through => :activity_items
  
  scope :is_suggest,  :conditions => ["activities.suggest = ?", true]
  
  has_attached_file :logo, :styles => {:original => "60x60"}, :default_url => "nopic.jpg"
  has_attached_file :poster,
    :styles          => {:original => SITE_SETTINGS["activity_original"], :middle => SITE_SETTINGS["activity_middle"]},
    :url             => SITE_SETTINGS["paperclip_url"],
    :path            => SITE_SETTINGS["paperclip_path"],
    :default_url     => "nopic.jpg"
end
