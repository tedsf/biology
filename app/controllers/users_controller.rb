class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = 'to complete sign-up, check your email for confirmation'
      redirect_to root_path
      SignupMailer.welcome_email(@user).deliver
    else
      flash[:danger] = @user.errors.full_messages.each { |error| error }.join(', ')
      redirect_to new_user_path
    end
  end

  private
  def user_params
    params.require(:user).permit(:username, :email, :password)
  end
end
