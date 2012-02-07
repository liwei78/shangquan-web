#encoding: utf-8
class ApplicationController < ActionController::Base
  protect_from_forgery
  
  def dev?
    Rails.env == "development"
  end
  
  def loggin?
    session[:signcode]||cookies[:signcode] ? true : false
  end
  
  # def get_current_user
  #   User.find_by_signcode(session[:signcode]||cookies[:signcode]) if loggin?
  # end
  
  def current_user_name
    session[:user_name]||cookies[:user_name]
  end
  
  def current_user_id
    session[:user_id]||cookies[:user_id]
  end
  
  private
  
  def need_user_login
    unless loggin?
      flash[:notice] = "请登录"
      redirect_to welcome_users_url
    end 
  end
  
end
