class Photo < ActiveRecord::Base
  belongs_to :klass
  has_attached_file :file,
    :styles => { :original => "600>", :small => "120>" },
    :url => "/:class/:attachment/:id/:style_:basename.:extension",
    :path => ":rails_root/assets/images/:class/:attachment/:id/:style_:basename.:extension"
end
