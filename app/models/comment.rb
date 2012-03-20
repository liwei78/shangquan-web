class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :klass, :polymorphic => true
  validates :content, :presence   => true
  
  scope :promote, :conditions => ["comments.resource_type = ?", 0]
  scope :block,   :conditions => ["comments.resource_type = ?", 1]
  scope :deleted, :conditions => ["comments.resource_type = ?", 2]
  
  scope :top, :limit => 5, :order => "comments.id asc"
  
end
