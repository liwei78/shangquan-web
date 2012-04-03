# encoding: utf-8
class Item < ActiveRecord::Base
  acts_as_taggable
  has_many :photos, :as => :klass
  belongs_to :brand
  belongs_to :user
  has_many :comments, :as => :klass, :include => :user
  has_many :article_items
  has_many :articles, :through => :article_items
  has_many :activity_items
  has_many :activities, :through => :activity_items
  has_many :category_items
  has_many :categories, :through => :category_items
  
  # 用户与喜欢物品的关系
  has_many :user_items
  has_many :like_users, :through => :user_items, :source => :user
  
  scope :block,       :conditions => ["items.state = ?", 0]
  scope :auditing,    :conditions => ["items.state = ?", 1]
  scope :white,       :conditions => ["items.state = ?", 2]
  scope :deleted,     :conditions => ["items.state = ?", 3]
  scope :in_store,    :conditions => ["items.store = ?", true]
  scope :is_suggest,  :conditions => ["items.suggest = ?", true]
  scope :is_top,      :conditions => ["items.top = ?", true]

  
  has_attached_file :poster,
    :styles          => {:original => SITE_SETTINGS["item_original"], :small => ""},
    :convert_options => {:small => SITE_SETTINGS["item_small_covert"]},
    :url             => SITE_SETTINGS["paperclip_url"],
    :path            => SITE_SETTINGS["paperclip_path"],
    :default_url     => "itemnopic.jpg"
  
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
