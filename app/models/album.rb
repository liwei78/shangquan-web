class Album < ActiveRecord::Base
  has_many :photos, :as => "klass", :order => "photos.id desc"
end
