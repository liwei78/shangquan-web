class Brand < ActiveRecord::Base
  has_attached_file :poster,
    :styles      => { :original => "600>", :small => "120>" },
    :url         => SITE_SETTINGS["paperclip_url"],
    :path        => SITE_SETTINGS["paperclip_path"],
    :default_url => "nopic.jpg"
    
  has_many :goods, :order => "id desc"
    
  def self.list_for_select
    self.all.map {|b| [b.title, b.id]}
  end
  
end
