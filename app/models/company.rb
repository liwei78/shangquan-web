class Company < ActiveRecord::Base
  validates :title, :presence => true
  has_many :likes, :as => :klass
  has_many :comments, :as => :klass
end
