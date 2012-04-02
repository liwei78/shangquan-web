class PhotoTemp < ActiveRecord::Base
  has_attached_file :file,
    :styles      => { :original => SITE_SETTINGS["temp_original"]},
    :url         => SITE_SETTINGS["temp_url"],
    :path        => SITE_SETTINGS["temp_path"],
    :default_url => "nopic.jpg"
end
