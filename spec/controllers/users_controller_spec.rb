# encoding: utf-8
require 'spec_helper'

describe UsersController do
  
  
  def valid_attributes
    {
      
    }
  end
  
  def valid_session
    {
      :signcode => "test",
      :user_name => "test", 
      :user_id => "1",
      :rtype => "1"
    }
  end

  describe "GET 'publish'" do
    fixtures :users
    it "redirect when not login" do
      get 'publish', {}, {}
      response.should redirect_to(welcome_users_url)
    end
    
    it "returns http success" do
      get 'publish', {}, valid_session
      response.should be_success
    end
  end
  
  describe "users" do
    it "create user" do
      # post 'create', {
      #   :email => "normal@user.com",
      #   :name => "normal", 
      #   :password => "1234",
      #   :password_confirmation => "1234"
      # }, {}
      # User.last.name.should eq("normal")
      # response.should redirect_to(articles_user_url(User.last))
      # User.last.rtype.should eq(1)
    end
  end

  describe "POST 'postpublish'" do
    fixtures :users
    fixtures :categories
    fixtures :areas
    it "post a single article" do
      post 'postpublish', {
        :title => "it's a sample article", 
        :content => "it's content", 
      }, valid_session
      response.should redirect_to(articles_user_url(1))
      Article.last.title.should  eq("it's a sample article")
      Article.last.is_article.should  be_true
      Article.last.state.should  eq(1)
    end

    it "post a article with photos" do
      post 'postpublish', {
        :relate_1 => "1"
      }, valid_session
      response.should redirect_to(articles_user_url(1))
      Article.last.is_photo.should  be_true
    end
    
    it "post a article with video code" do
      post 'postpublish', {
        :title => "it's a video code article", 
        :content => "it's content", 
        :relate_2 => "2", 
        :code => "a sample code"
      }, valid_session
      response.should redirect_to(articles_user_url(1))
      Article.last.code.should  eq("a sample code")
      Article.last.is_video.should  be_true
    end
    
    it "post a article about a activity" do
      post 'postpublish', {
        :title => "it's a article", 
        :content => "it's content", 
        :relate_3 => "3", 
        :schedule => "a schedule",
        :address => "a address",
        :category => Category.last.name, 
        :area => Area.last.name, 
      }, valid_session
      response.should redirect_to(articles_user_url(1))
      Article.last.schedule.should  eq("a schedule")
      Article.last.is_activity.should  be_true
      Article.last.is_company.should  be_true
    end

    it "post a article with brand" do
      post 'postpublish', {
        :relate_4 => "4"
      }, valid_session
      response.should redirect_to(articles_user_url(1))
      Article.last.is_brand.should  be_true
    end
    
    it "post a article about a good" do
      post 'postpublish', {
        :title => "it's a article", 
        :content => "it's content", 
        :relate_5 => "5", 
        :price => 99.99
      }, valid_session
      response.should redirect_to(articles_user_url(1))
      Article.last.price.should  eq(99.99)
      Article.last.is_good.should  be_true
    end
    
  end

end
