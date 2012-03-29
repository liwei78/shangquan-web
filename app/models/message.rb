class Message < ActiveRecord::Base
  belongs_to :user
  
  scope :sysmsg, :conditions => ["messages.sysmsg = ?", true]
  scope :mymsg,  :conditions => ["messages.sysmsg = ?", false]
  scope :unread,  :conditions => ["messages.read = ?", false]
  
  def self.sys_send_to(uid, title, content)
    create(
      :user_id => uid,
      :title   => title,
      :content => content, 
      :sysmsg  => true)
  end
  
  
  
end
