require_relative "application_mailer"

class SignupMailer < ApplicationMailer
  default from: "bullzeyeshop@gmail.com"

  def welcome_email(user)
    @user = user
    mail(to: @user.email, subject: 'Welcome to BULLZEYE!')
  end
end

