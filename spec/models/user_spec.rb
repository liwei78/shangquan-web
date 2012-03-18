require 'spec_helper'

describe User do
  it "create user" do
    user = User.create(
      :email => "normal@user.com",
      :name => "normal", 
      :password => "1234",
      :password_confirmation => "1234")
    User.last.should eq(user)
    User.count.should eq(1)
  end
end
