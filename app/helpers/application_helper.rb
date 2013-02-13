module ApplicationHelper
  
  def current_user
    @current_user ||= User.find_by_fbid(session[:fbid]) if session[:fbid]
  end
  
  def user_logged_in?
    !!session[:fbid]
  end
  
  def image_fullurl(source)
    URI.join(root_url, image_path(source))
  end
  
end
