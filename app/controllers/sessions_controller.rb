class SessionsController < ApplicationController
  
  def new
    @user = User.new
  end

  def create
    session[:return_to] ||= request.referer
    @user = login(params[:username], params[:password])
    if @user
      flash[:notice] = "welcome"
      redirect_to user_path(@user)
    else
      flash[:alert] = "username or password incorrect"
      redirect_to session.delete(:return_to)
    end
  end

  def delete
    logout
    redirect_to root_url, notice: "logged out"
  end

end
