# encoding: utf-8
require 'spec_helper'

describe UsersController do
  
  fixtures :users
  fixtures :activity_categories
  fixtures :activity_areas
  
  def valid_attributes
    {
      
    }
  end
  
  def valid_session
    {
      :signcode => "test",
      :user_name => "test", 
      :user_id => "1"
    }
  end

  describe "GET 'publish'" do
    it "redirect when not login" do
      get 'publish', {}, {}
      response.should redirect_to(welcome_users_url)
    end
    
    it "returns http success" do
      get 'publish', {}, valid_session
      response.should be_success
    end
  end

  describe "POST 'postpublish'" do
    it "post http success" do
      post 'postpublish', {
        :title => "it's a mulity type article", 
        :content => "it's content", 
        :tag_list => "tag1，tag2，tag3", 
        
        :relate_activity => "1", 
        :schedule => "activity schedule",
        :address => "activity address",
        :activity_category => ActivityCategory.first.name,  
        :activity_area => ActivityArea.first.name,  
        
        :relate_good => "1", 
        :price => "100.1",
        
        :relate_brand => "1"
        
      }, valid_session
      response.should redirect_to(articles_user_url(1))
      Article.last.title.should  eq("it's a mulity type article")
      Activity.last.title.should  eq("it's a mulity type article")
      Good.last.title.should   eq("it's a mulity type article")
      Article.count.should eq(2)
    end
  end

end
