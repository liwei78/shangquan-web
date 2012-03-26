class Activity < ActiveRecord::Base
  has_attached_file :poster,
    :styles          => {:original => SITE_SETTINGS["activity_original"], :middle => SITE_SETTINGS["activity_middle"]},
    :url             => SITE_SETTINGS["paperclip_url"],
    :path            => SITE_SETTINGS["paperclip_path"],
    :default_url     => "nopic.jpg"
end
