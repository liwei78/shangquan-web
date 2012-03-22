# encoding: utf-8
class Article < ActiveRecord::Base
  belongs_to :user
  # after_create :create_user_feed
  has_many :feeds, :as => :klass
  has_many :photos, :as => :klass
  has_many :comments, :as => :klass, :include => :user
  has_many :article_items
  has_many :items, :through => :article_items
  acts_as_taggable
  
  scope :is_article, :conditions => ["articles.is_article = ?", true]
  scope :is_photo,   :conditions => ["articles.is_photo = ?", true]
  scope :is_video,   :conditions => ["articles.is_video = ?", true]
  scope :is_brand,   :conditions => ["articles.is_brand = ?", true]
  scope :is_activity,:conditions => ["articles.is_activity = ?", true]
  scope :is_company, :conditions => ["articles.is_company = ?", true]
  scope :is_item,    :conditions => ["articles.is_item = ?", true]
  
  scope :block,    :conditions => ["articles.state = ?", 0]
  scope :auditing, :conditions => ["articles.state = ?", 1]
  scope :white,    :conditions => ["articles.state = ?", 2]
  scope :deleted,  :conditions => ["articles.state = ?", 3]
  
  has_attached_file :poster,
    :styles          => { :original => SITE_SETTINGS["crop_original"], :small => "" },
    :convert_options => {:small => SITE_SETTINGS["crop_small_covert"]},
    :url             => SITE_SETTINGS["paperclip_url"],
    :path            => SITE_SETTINGS["paperclip_path"],
    :default_url     => "nopic.jpg"
  
  
  # TODO: when the feed is about photos, I can use cache-photos
  def create_user_feed
    Feed.create(
      :user_id       => self.user_id,
      :klass_type    => "Article", 
      :klass_id      => self.id, 
      :target_url    => "/users/#{self.user_id}/articles/#{self.id}",
      :title         => self.title, 
      :content       => self.content
    )
  end
  
  def created_from_now
    now_time = Time.now
    diff = now_time - self.created_at
    day, hrs, mins, sec = sec2dhms(diff)
    _out = ""
    if day == 0
      _out = hrs.to_s + "小时前" if hrs >= 1
      _out = mins.to_s + "分钟" + "前" if hrs == 0 and mins > 0
      _out = "现在" if hrs == 0 and mins == 0
    else
      _out = "#{day}天前"
    end
    _out
  end

  private
  
  def sec2dhms(secs)
    time = secs.round          # Get rid of microseconds
    sec = time % 60            # Extract seconds
    time /= 60                 # Get rid of seconds
    mins = time % 60           # Extract minutes
    time /= 60                 # Get rid of minutes
    hrs = time % 24            # Extract hours
    time /= 24                 # Get rid of hours
    days = time                # Days (final remainder)
    [days, hrs, mins, sec]     # Return array [d,h,m,s]
  end

end
