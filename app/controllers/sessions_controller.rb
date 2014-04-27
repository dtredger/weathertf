class SessionsController < ApplicationController
  
  def new
    @user = User.new
  end

  def create
    @user = login(params[:username], params[:password])
    if @user
      redirect_back_or_to(:users, notice: "welcome")
    else
      flash.now[:alert] = "that must not be true"
      render 'users/index'
      # redirect_to root_url
    end
  end

  def delete
    logout
    redirect_to root_url, notice: "logged out"
  end

end
