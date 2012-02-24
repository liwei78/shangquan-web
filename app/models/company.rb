class Company < ActiveRecord::Base
  acts_as_taggable
  validates :title, :presence => true
  has_many :likes, :as => :klass
  has_many :comments, :as => :klass
end
