class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user, :check_registered_user

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def check_registered_user
    redirect_to root_path unless current_user
  end

  def remote_ip
    if request.remote_ip == '127.0.0.1' || request.remote_ip == "::1"
      '162.216.46.154'
    else
      request.remote_ip
    end
  end
end
