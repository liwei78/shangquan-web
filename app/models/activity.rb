# encoding: utf-8
class Activity < ActiveRecord::Base
  
  has_many :activity_articles
  has_many :articles, :through => :activity_articles
  
  has_many :activity_items
  has_many :items, :through => :activity_items

  belongs_to :archetype
  belongs_to :user
  
  scope :is_suggest,  :conditions => ["activities.suggest = ?", true]
  scope :opening, :conditions => ["activities.status = ?", 1]
  
  has_attached_file :logo, 
    :styles          => {:original => "60x60"}, 
    :url             => SITE_SETTINGS["paperclip_url"],
    :path            => SITE_SETTINGS["paperclip_path"],
    :default_url     => "nopic.jpg"
  has_attached_file :poster,
    :styles          => {:original => SITE_SETTINGS["activity_original"], :middle => SITE_SETTINGS["activity_middle"]},
    :url             => SITE_SETTINGS["paperclip_url"],
    :path            => SITE_SETTINGS["paperclip_path"],
    :default_url     => "nopic.jpg"

  def statue_name
    ["新增审核", "进行中", "活动结束"][self.status]
  end

  def has_map?
    self.latitude.present? and self.longitude.present?
  end
end
