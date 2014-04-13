class SessionsController < ApplicationController
  
  def new
  end

  def create
    @user = login(params[:username], params[:password])
    binding.pry
    if @user
      redirect_back_or_to(:users, notice: "welcome")
    else
      flash.now[:alert] = "no"
      render root_url
    end
  end

  def delete
    logout
    redirect_to root_url, notice: "logged out"
  end

end
