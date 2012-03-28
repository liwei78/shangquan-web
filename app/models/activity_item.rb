class ActivityItem < ActiveRecord::Base
  belongs_to :item
  belongs_to :activity
end
