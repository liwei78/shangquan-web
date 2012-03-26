class Banner < ActiveRecord::Base
  has_attached_file :poster,
    :styles          => {:original => SITE_SETTINGS["banner_original"]},
    :url             => SITE_SETTINGS["paperclip_url"],
    :path            => SITE_SETTINGS["paperclip_path"],
    :default_url     => "nopic.jpg"
    
  
  def self.sliders
    find(:all, :conditions => ["category = ?", 0], :limit => 4, :order => "position asc")
  end
  
  def self.tinies
    find(:all, :conditions => ["category = ?", 1], :limit => 4, :order => "position asc")
  end
  
end
