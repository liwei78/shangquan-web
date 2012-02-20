class Photo < ActiveRecord::Base
  belongs_to :klass, :polymorphic => true
  has_attached_file :file,
    :styles      => { :original => SITE_SETTINGS["crop_original"], :small => "" },
    :convert_options => { :small => SITE_SETTINGS["crop_small_covert"] },
    :url         => SITE_SETTINGS["paperclip_url"],
    :path        => SITE_SETTINGS["paperclip_path"],
    :default_url => "nopic.jpg"
end
