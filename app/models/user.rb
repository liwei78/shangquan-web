# encoding: utf-8
class User < ActiveRecord::Base
  attr_accessor  :password
  
  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  
  validates :email, 
    :presence   => true,
    :format     => {:with => email_regex}, 
    :uniqueness => true
  
  validates :password,
    :presence => true,
    :confirmation => true,
    :length => {:within => 4..20},
    :on => :create
    
  validates :password_confirmation,
    :presence => true,
    :length => {:within => 4..20},
    :on => :create
    
  validates :password,
    :allow_blank => true,
    :length => {:within => 4..20},
    :on => :update
    
  validates :name,
    :presence => true,
    :length => {:maximum => 16, :minimum => 1},
    :allow_blank => true
    
  validates :signcode,   :uniqueness => true
  validates :verifycode, :uniqueness => true

  before_create :encrypt_something
  before_update :change_password
  
  has_many :articles, :order => "articles.id desc"
  has_many :feeds,    :order => "feeds.id desc"
  has_many :likes
  has_many :goods, :order => "goods.id desc"
  has_many :activities, :order => "activities.id desc"
  has_many :photos, :as => :klass
  has_many :comments, :order => "comments.id desc"
  
  has_attached_file :avatar,
    :styles      => { :original => SITE_SETTINGS["avatar_original"], :thumb => SITE_SETTINGS["avatar_thumb"], :small => SITE_SETTINGS["avatar_small"] },
    :convert_options => { :thumb => SITE_SETTINGS["avatar_thumb_covert"] },
    :url         => SITE_SETTINGS["paperclip_url"],
    :path        => SITE_SETTINGS["paperclip_path"],
    :default_url => "avatar190.jpg"

  scope :white,  :conditions => ["users.promotion = ?", 20]
  scope :black,  :conditions => ["users.promotion = ?", 0]
  
  # recource_type base on user's promotion
  def rtype
    rtype = 1 if self.promotion > 0 && self.promotion < 20  # 0 < promotion < 20
    rtype = 2 if self.promotion = 20                   # in white list
    rtype = 0 if self.promotion = 0                    # in black list
    rtype
  end
  
  def self.authenticate(email, password)
    user = find_by_email(email)
    return if user.nil?
    return user if user.right_password?(password)
  end
  
  def right_password?(password)
    encrypted_password == encrypt(password)
  end
  
  def site_role
    ["普通用户", "时尚设计师", "商家用户", "品牌用户"][self.role]
  end
  
  private
  
  def encrypt_something
    self.salt               = make_salt if new_record?
    self.signcode           = encrypt(self.salt + rand(9999).to_s)
    self.verifycode         = encrypt(self.salt + rand(8888).to_s)
    self.encrypted_password = encrypt(password)
  end
  
  def change_password
    self.encrypted_password = encrypt(password) unless password.blank?
  end
  
  def encrypt(str)
    secure_hash("#{salt}--#{str}")
  end
  
  def make_salt
    secure_hash("#{Time.now.utc}--#{password}")
  end
  
  def secure_hash(str)
    Digest::SHA2.hexdigest(str)
  end
  
end
