require 'spec_helper'

describe User do
  
  # describe "user create" do
  #   it "create user" do
  #     user = User.create(
  #       :email => "normal@user.com",
  #       :name => "normal", 
  #       :password => "1234",
  #       :password_confirmation => "1234")
  #     User.last.should eq(user)
  #     User.count.should eq(1)
  #   end
  # end
  
  
  describe "relationships" do

    fixtures :users
    
    before(:each) do
      @jerry = User.find(5)
      @tom   = User.find(4)
    end

    it "should have a relationships method" do
      @jerry.should respond_to(:relationships)
    end

    it "should have a following method" do
      @tom.should respond_to(:following)
    end
    
    it "should have a following? method" do
      @tom.should respond_to(:following?)
    end

    it "should have a follow! method" do
      @tom.should respond_to(:follow!)
    end

    it "should follow another user" do
      @tom.follow!(@jerry)
      @tom.should be_following(@jerry)
    end

    it "should include the followed user in the following array" do
      @tom.follow!(@jerry)
      @tom.following.should include(@jerry)
    end
    
    it "should have an unfollow! method" do
      @jerry.should respond_to(:unfollow!)
    end

    it "should unfollow a user" do
      @tom.follow!(@jerry)
      @tom.unfollow!(@jerry)
      @tom.should_not be_following(@jerry)
    end
    
    it "should have a reverse_relationships method" do
      @tom.should respond_to(:reverse_relationships)
    end

    it "should have a followers method" do
      @tom.should respond_to(:followers)
    end

    it "should include the follower in the followers array" do
      @tom.follow!(@jerry)
      @jerry.followers.should include(@tom)
    end
    
  end
end
