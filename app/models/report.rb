class Report < ActiveRecord::Base
  has_many :photos, :as => :klass
end
