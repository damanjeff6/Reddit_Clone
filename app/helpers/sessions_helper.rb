module SessionsHelper

  def authenticate
    redirect_to root_url unless logged_in?
  end

  def current_user
    @current_user ||= User.find_by_session_token(session[:session_token])
  end

  def logged_in?
    !!current_user
  end

  def login_user!(user)
    user.reset_session_token!
    session[:session_token] = user.session_token
  end

  def logout_user!(user)
    user.reset_session_token!
    session[:session_token] = nil
  end

end
