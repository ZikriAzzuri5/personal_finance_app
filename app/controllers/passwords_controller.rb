class PasswordsController < ApplicationController
  def edit
    @user = user_scope
  end

  def update
    @user = user_scope

    if @user.update(password_params) && !@user.password.nil?
      @user.clear_password_token!
      redirect_to login_path, notice: 'Successfully changed your password'
    else
      @user.errors.add(:password, "can't be blank")
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def password_params
    params.require(:user).permit(:password, :password_confirmation)
  end

  def user_scope
    user = User.with_reset_password_token(params[:token])

    if user.nil?
      redirect_to new_reset_password_path, alert: 'Invalid Token'
    elsif user.password_token_expired?
      redirect_to new_reset_password_path, alert: 'Token is expired'
    end

    user
  end
end
