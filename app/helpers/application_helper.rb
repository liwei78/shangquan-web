module ApplicationHelper
  def site_title
    SITE_SETTINGS["site_title"]
  end
  
  def seo_title
    @page_title ? "#{@page_title} - #{site_title}" : site_title
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
  
  def is_me?(user)
    current_user_id.to_i == user.id
  end
  
  # used for front site nav
  def nav_class(nav)
    'on' if action_name == nav or controller_name == nav.pluralize
  end
  
  def js_void
    "javascript:void(0);"
  end
  
  def nbsp(n=1)
    raw("&nbsp;"*n)
  end
  
  def flashplayer(code)
    raw '<object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=7,0,19,0" width="480" height="400"><param name="movie" value="'+code+'" /><param name="quality" value="high" /><embed src="'+code+'" quality="high" pluginspage="http://www.macromedia.com/go/getflashplayer" type="application/x-shockwave-flash" width="480" height="400"></embed></object>'
  end

end
