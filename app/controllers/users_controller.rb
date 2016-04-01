class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:edit, :update]

  def index
    current_user = User.find_by_id(session[:current_user_id])
  end

  def edit
  end

  def update
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :username, :email,
    :password, :password_confirmation)
  end

end
