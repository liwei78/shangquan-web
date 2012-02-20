class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :klass, :polymorphic => true
  validates :content, :presence   => true
end
