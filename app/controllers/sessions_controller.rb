class SessionsController < ApplicationController
  
  def new
  end

  def create
    user = login(params[:username], params[:password])
    if user
      redirect_to user_path(user), notice: "welcome"
    else
      flash[:alert] = "no"
      redirect_back_or_to root_url
    end
  end

  def destroy
    logout
    redirect_to root_url, notice: "logged out"
  end


end