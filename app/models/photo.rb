class Photo < ActiveRecord::Base
  belongs_to :klass, :polymorphic => true
  has_attached_file :file,
    :styles      => { :original => "600>", :small => "120>" },
    :url         => SITE_SETTINGS["paperclip_url"],
    :path        => SITE_SETTINGS["paperclip_path"],
    :default_url => "nopic.jpg"
end
