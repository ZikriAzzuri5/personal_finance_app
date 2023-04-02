class ApplicationController < ActionController::Base
  helper_method :current_user
  helper_method :user_signed_in?

  def authenticate_user!
    redirect_to login_path if current_user.blank?
  end

  def current_user
    @current_user ||= User.find_by_id(session[:user_id]) if session.include?(:user_id) && session[:user_id]
  end

  def user_signed_in?
    current_user.present?
  end

  def redirect_if_user_authenticated
    if user_signed_in?
      redirect_to root_path, notice: 'Already Logged In'
    end
  end
end
