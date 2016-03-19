class SessionsController < ApplicationController

  def new
  end

  def create
    current_user = User.find_by(email: params[:email])

    if current_user && current_user.authenticate(params[:password])
      session[:user_id] = current_user.id
      redirect_to posts_url, notice: "You're Logged In"
    else
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to posts_url, notice: "Logged Out!"
  end

end
