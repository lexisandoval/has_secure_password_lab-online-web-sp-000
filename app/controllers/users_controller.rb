class UsersController < ApplicationController

  def new 
  end 

  def create
    @user = User.create(user_params)
    if @user.password == @user.password_confirmation
      @user.save
      session[:user_id] = @user.id 
      redirect_to homepage_path
    else 
      redirect_to signup_path
    end 
  end
   
  private
   
  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end

end