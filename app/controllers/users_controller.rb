class UsersController < ApplicationController
  
  def new
    @return = params[:return]
    
    # check to see if the user already has an account
    # this happens in weird circumstances
    unless params[:fbid].blank?
      @user = User.find params[:fbid]
      unless @user.nil?
        session[:fbid] = @user.fbid
        render 'edit'
        return
      end
    end
    
    @user = User.new
  end
  
  def create
    @user = User.new params[:user]
    if @user.save
      session[:fbid] = @user.fbid
      unless params[:return].blank?
        redirect_to params[:return]
      else
        redirect_to edit_user_path(@user), :notice => 'Your account has been successfully created.'
      end
    else
      flash.now[:error] = 'Could not save new user =('
      render 'new'
    end
  end
  
  def edit
    @user = current_user
    @return = params[:return]
  end
  
  def update
    @user = current_user
    if @user.update_attributes params[:user]
      unless params[:return].blank?
        redirect_to params[:return]
      else
        redirect_to edit_user_path(@user), :notice => 'Your account has been successfully updated.'
      end
    else
      flash.now[:error] = 'Could not edit user =('
      render 'edit'
    end
  end
  
end
