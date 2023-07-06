class SessionsController < ApplicationController
  before_action :authenticate_user!, only: [:destroy]
  before_action :redirect_if_user_authenticated, except: [:destroy]

  def new
  end

  def create
    session_params = params.permit(:email, :password)
    @user = User.find_by(email: session_params[:email])

    if @user && @user.authenticate(session_params[:password])
      session[:user_id] = @user.id
      redirect_to root_path
    else
      flash[:notice] = "Login is invalid!"
      redirect_to login_path
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "You have been signed out"

    redirect_to root_path
  end
end
