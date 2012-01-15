class Article < ActiveRecord::Base
  belongs_to :user
  after_create :create_user_feed
  
  
  def create_user_feed
    Feed.create(
      :user_id    => self.user_id,
      :klass_type => "Article", 
      :klass_id   => self.id, 
      :target_url => "/users/#{self.user_id}/articles/#{self.id}", 
      :title      => self.title, 
      :content    => self.content
    )
  end
end
