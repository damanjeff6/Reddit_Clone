class SessionsController < ApplicationController

  def new
    @user = User.new
    render :new
  end

  def create
    @user = User.find_by_credentials(
      params[:user][:username],
      params[:user][:password]
    )
    if @user
      login_user!(@user)
    else
      flash[:errors] = "Invalid username and/or password"
      render :new
    end
  end

  def destroy
    if logged_in?
      @user = current_user
      logout_user!(@user)
      redirect_to root_url
    else
      flash[:errors] = "You can't go out until you go in!!!"
      redirect_to new_session_url
    end
  end
end
