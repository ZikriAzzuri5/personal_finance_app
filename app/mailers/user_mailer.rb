class UserMailer < ApplicationMailer
  def change_password(user_id)
    @user = User.find(user_id)

    mail(to: @user.email, subject: 'Email')
  end
end
