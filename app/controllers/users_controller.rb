class UsersController < ApplicationController

  before_filter :correct_user, only: [:show, :edit, :update, :delete, :mail_settings]  

  def index
    @background = ["1.jpg","2.jpg","3.jpg"].sample
    @user = User.new
  end

  def show
    Thread.new { get_forecast }.join
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      auto_login(@user)
      # Thread.new { UserTexter.welcome_text(@user).deliver }.join
      redirect_to user_path(@user)
    else
      flash[:notice] = "nope"
      redirect_to new_user_path
    end
  end

  def edit
  end

  def update
    if @user.update_attributes(user_params)
      redirect_to :back, notice: "updated"
    else
      render :edit, alert: "error!"
    end
  end

  def delete
  end


  def sms
    if UserTexter.update_text(current_user).deliver
      flash[:notice] = "msg sent"
    else
      flash[:alert] = "msg sending error"
    end
  end


  private

    def user_params
      params.require(:user).permit(:username, :email, 
        :phone_number, :carrier, :password, :lat, :lon, :digest, :alert_percent)
    end

    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_path) unless current_user == @user
    end



end
