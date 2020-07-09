class SessionsController < ApplicationController
  def index
  end

  def create
    @user = User.find_by(Name: params[:name])

    if @user
      flash[:notice] = 'You signed in successfully!'
      session[:id] = @user.id
      session[:name] = @user.Name
      redirect_to articles_path
    else
      flash[:alert] = 'No User found. Please sign up'
      redirect_to new_user_path
    end
  end

  def destroy
    reset_session
    redirect_to sessions_path
  end

  def user_logged_in?
    !session[:id].nil?
  end

  def logged_in_user
    return if logged_in?

    flash[:danger] = 'Please log in.'
    redirect_to sessions_path
  end
end
