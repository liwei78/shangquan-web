module ApplicationHelper
  def site_title
    SITE_SETTINGS["site_title"]
  end
  
  def seo_title
    SITE_SETTINGS["site_title"]
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
  
  # used for front site nav
  def nav_class(nav)
    'on' if action_name == nav
  end
  
  # used for admin nav
  def admin_nav?(flag)
    'on' if flag == @admin_nav_flag
  end

end
