module SessionsHelper

  #Method logs in
  def log_in(user)
    session[:user_id] = user.id
  end

  #Method returns current user
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  #Method checks if given user is the same as current one
  def current_user?(user)
    user == current_user
  end

  #Method checks if user is logged in
  def logged_in?
    !current_user.nil?
  end

  #Method logs out
  def log_out
    session.delete(:user_id)
    @current_user = nil
  end

  #Method redirects back or to given address
  def redirect_back_or(default)
    redirect_to(session[:forwarding_url] || default)
    session.delete(:forwarding_url)
  end

  # Method stores the URL trying to be accessed.
  def store_location
    session[:forwarding_url] = request.original_url if request.get?
  end
end
