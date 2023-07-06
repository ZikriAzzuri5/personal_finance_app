class ResetPasswordsController < ApplicationController
  def new
    @user = User.new
  end

  # def create
  #   @user = User.find_by(email: params[:email])

  #   if @user.present?
  #     @user.generate_password_token!

  #     UserMailer.change_password(@user.id).deliver_now
  #   end

  #   redirect_to new_reset_password_path, notice: 'Check your email if you are reigstered'
  # end

  def create
    if params[:email].blank?
      redirect_to new_reset_password_path, alert: 'Email cannot be empty'
      return
    end

    @user = User.find_by(email: params[:email])

    if @user.present?
      @user.generate_password_token!

      UserMailer.change_password(@user.id).deliver_now

      redirect_to new_reset_password_path, notice: 'Check your email if you are registered'
    else
      redirect_to new_reset_password_path, alert: 'User not found'
    end
  end
end
