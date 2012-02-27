class Article < ActiveRecord::Base
  belongs_to :user
  after_create :create_user_feed
  has_many :photos, :as => :klass
  has_many :comments, :as => :klass
  acts_as_taggable
  
  scope :type_0, :conditions => ["article_type = ?", 'article']
  scope :type_1, :conditions => ["article_type = ?", 'photo']
  scope :type_2, :conditions => ["article_type = ?", 'video']
  scope :type_3, :conditions => ["article_type = ?", 'brand']
  
  has_attached_file :poster,
    :styles      => { :original => SITE_SETTINGS["crop_original"], :small => SITE_SETTINGS["crop_small"] },
    :url         => SITE_SETTINGS["paperclip_url"],
    :path        => SITE_SETTINGS["paperclip_path"],
    :default_url => "nopic.jpg"
  
  
  # TODO: when the feed is about photos, I can use cache-photos
  def create_user_feed
    Feed.create(
      :user_id       => self.user_id,
      :klass_type    => "Article", 
      :klass_id      => self.id, 
      :target_url    => "/users/#{self.user_id}/articles/#{self.id}",
      :template_type => self.article_type,
      :title         => self.title, 
      :content       => self.content,
      :code          => self.code.presence
    )
  end
  
end
