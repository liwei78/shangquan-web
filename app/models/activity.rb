class Activity < ActiveRecord::Base
  acts_as_taggable
  validates :title, :presence => true
  has_many :likes, :as => :klass
  has_many :comments, :as => :klass
  has_attached_file :poster,
    :styles      => { :original => SITE_SETTINGS["crop_original"], :small => SITE_SETTINGS["crop_small"] },
    :url         => SITE_SETTINGS["paperclip_url"],
    :path        => SITE_SETTINGS["paperclip_path"],
    :default_url => "nopic.jpg"

  scope :promote, :conditions => ["activities.resource_type = ?", 1]
  scope :block,   :conditions => ["activities.resource_type = ?", 0]
  scope :white,   :conditions => ["activities.resource_type = ?", 2]
  scope :deleted, :conditions => ["activities.resource_type = ?", 3]
end
