class PhotoTemp < ActiveRecord::Base
  has_attached_file :file,
    :styles          => { :original => SITE_SETTINGS["crop_original"], :small => "" },
    :convert_options => {:small => SITE_SETTINGS["crop_small_covert"]},
    :url         => SITE_SETTINGS["temp_url"],
    :path        => SITE_SETTINGS["temp_path"],
    :default_url => "nopic.jpg"
end
