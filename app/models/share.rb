class Share < ActiveRecord::Base
  belongs_to :klass, :polymorphic => true
  belongs_to :user
end
