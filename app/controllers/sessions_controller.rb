class SessionsController < ApplicationController
  
  def new
    @user = User.new
  end

  def create
    session[:return_to] ||= request.referer
    @user = login(params[:username], params[:password])
    if @user
      redirect_to user_path(@user)
    else
      flash[:alert] = "that must not be true"
      redirect_to session.delete(:return_to)
    end
  end

  def delete
    logout
    redirect_to root_url, notice: "logged out"
  end

end
