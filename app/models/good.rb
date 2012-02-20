class Good < ActiveRecord::Base
  after_create :create_user_feed
  has_many :likes
  has_many :users, :through => :likes 
  has_many :photos, :as => :klass
  belongs_to :brand
  belongs_to :user
  has_many :comments, :as => :klass
  
  has_attached_file :poster,
    :styles      => { :original => SITE_SETTINGS["good_original"], :thumb => SITE_SETTINGS["good_thumb"], :small => SITE_SETTINGS["good_small"] },
    :convert_options => { :thumb => SITE_SETTINGS["good_thumb_covert"] },
    :url         => SITE_SETTINGS["paperclip_url"],
    :path        => SITE_SETTINGS["paperclip_path"],
    :default_url => "nopic.jpg"
  
  # TODO: poster cache for feed
  def create_user_feed
    Feed.create(
      :user_id       => self.user_id,
      :klass_type    => "Good", 
      :klass_id      => self.id, 
      :target_url    => "/users/#{self.user_id}/goods/#{self.id}",
      :template_type => 'good',
      :title         => self.title, 
      :content       => self.content
    )
  end
  
end
