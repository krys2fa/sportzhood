class ApplicationController < ActionController::Base
  helper_method :set_current_user

  def set_current_user
    if session[:id]
      @current_user ||= User.find(session[:id])
    else
      @current_user = nil
    end
  end

  def authenticate_user
    redirect_to sessions_path if session[:id].nil?
  end
end
