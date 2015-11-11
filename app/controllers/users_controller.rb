class UsersController < ApplicationController
  def new
  	@user = User.new
  end
  def show
    @user = User.find(params[:id])
  end

  def create
    secure_params = params.require(:user).permit(:name, :email, :password, :password_confirmation)
    @user = User.new(secure_params)
    if @user.save
      remember @user
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user
    else
      render 'new'
    end
  end
end
