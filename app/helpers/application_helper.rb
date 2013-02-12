module ApplicationHelper
  
  def current_user
    @current_user ||= User.find_by_fbid(session[:fbid]) if session[:fbid]
  end
  
  def user_logged_in?
    !!session[:fbid]
  end
  
end
