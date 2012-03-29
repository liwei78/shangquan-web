require 'spec_helper'

describe Relationship do
  describe "relationships" do
    fixtures :users
    it "should have a relationships method" do
      tom = User.find(4)
      tom.should respond_to(:relationships)
    end
  end
  
  describe "follow methods" do
    
    fixtures :users
    
    before(:each) do
      @tom   = User.find(4)
      @jerry = User.find(5)
      @relationship = @tom.relationships.build(:followed_id => @jerry.id)
      @relationship.save
    end

    it "should have a follower attribute" do
      @relationship.should respond_to(:follower)
    end

    it "should have the right follower" do
      @relationship.follower.should == @tom
    end

    it "should have a followed attribute" do
      @relationship.should respond_to(:followed)
    end

    it "should have the right followed user" do
      @relationship.followed.should == @jerry
    end
  end
  
  describe "validations" do
    
    fixtures :users
    
    before(:each) do
      @tom   = User.find(4)
      @jerry = User.find(5)
      @relationship = @tom.relationships.build(:followed_id => @jerry.id)
    end

    it "should require a follower_id" do
      @relationship.follower_id = nil
      @relationship.should_not be_valid
    end

    it "should require a followed_id" do
      @relationship.followed_id = nil
      @relationship.should_not be_valid
    end
  end
    
end
