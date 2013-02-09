class UsersController < ApplicationController
  
  def new
    @user = User.new
    @return = params[:return]
  end
  
  def create
    @user = User.new params[:user]
    if @user.save
      unless params[:return].blank?
        redirect_to params[:return]
      else
        redirect_to edit_user(@user)
      end
    else
      @error = 'Could not save new user =('
      render 'new'
    end
  end
  
end
