class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_user_name(params[:user_name])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to '/user/dashboard'
      flash[:success] = "Welcome back!"
    else
      flash.now[:error] = "Invalid user name/password combination"
      render "new"
    end
  end

  def destroy
  session[:user_id] = nil
  redirect_to root_url
  end
end
