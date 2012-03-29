#encoding: utf-8
class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :current_user
  
  def dev?
    Rails.env == "development"
  end
  
  def get_current_user
    User.find(session[:user_id]||cookies[:user_id]) if loggin?
  end
  
  def current_user_name
    session[:user_name]||cookies[:user_name]
  end
  
  def current_user_id
    session[:user_id]||cookies[:user_id]
  end
  
  def current_user_rtype
    session[:rtype]||cookies[:rtype]
  end

  def loggin?
    (session[:signcode].present?||cookies[:signcode].present?)&&current_user_name.present?&&current_user_id.present? ? true : false
  end
  
  def current_user
    @current_user = get_current_user if loggin?
  end
  
  private
  
  def need_user_login
    unless loggin?
      flash[:notice] = "请登录"
      redirect_to welcome_users_url
    end 
  end
  
end
