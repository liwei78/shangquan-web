#encoding: utf-8
class ApplicationController < ActionController::Base
  protect_from_forgery
  
  def dev?
    Rails.env == "development"
  end
  
  def loggin?
    session[:signcode]||cookies[:signcode] ? true : false
  end
  
  def current_user
    @current_user = User.find_by_signcode(session[:signcode]||cookies[:signcode]) if loggin?
  end
  
  def current_user_name
    session[:user_name]||cookies[:user_name]
  end
  
  def current_user_id
    session[:user_id]||cookies[:user_id]
  end
  
  private
  
  def need_admin_login
    unless ToolBox.admin_login?(session[:admin_key])
      flash[:error] = '管理员未登录'
      redirect_to ezadmin_login_url
    end
  end
  
end
