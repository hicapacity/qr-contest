class SessionsController < ApplicationController
  
  def create
    user = User.find_by_fbid params[:fbid]
    if user.nil?
      render :json => {:success => false}
    else
      session[:fbid] = user.fbid
      render :json => {:success => true}
    end
  end
  
  def destroy
    session[:fbid] = nil
    # should probably redirect somewhere?
  end
  
end
