class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      redirect_to posts_path, notice: "You're Signed Up!"
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :username, :email, :password, :password_confirmation, :current_password)
  end

end
