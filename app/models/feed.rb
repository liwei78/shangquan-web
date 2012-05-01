# encoding: utf-8
class Feed < ActiveRecord::Base
  belongs_to :user
  belongs_to :klass, :polymorphic => true
  
  scope :with_username, :select => "users.name as username, feeds.*", :joins => "left join users on users.id = feeds.user_id"
  
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
