class Feed < ActiveRecord::Base
  belongs_to :user
  
  scope :with_username, :select => "users.name as username, feeds.*", :joins => "left join users on users.id = feeds.user_id"
end
