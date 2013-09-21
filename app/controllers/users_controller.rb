class UsersController < ApplicationController

  before_filter :correct_user, only: [:show, :edit, :update, :delete, :mail_settings, :sms]
  respond_to :js, :html

  def index
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
      Resque.enqueue(SendWelcomeEmail, @user.id)
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

    respond_to do |format|
      format.js
    end

    # TelAPI method
    request_data = { :To => current_user.phone_number, :Body => "Hello from WeatherPing", :Token => ENV['TELAPI_TOKEN'] }
    Thread.new { r = HTTParty.post("https://heroku.telapi.com/send_sms", :body => request_data) }.join
    puts "TELAPI response: #{r}"

    #if UserMailer.update_text(current_user).deliver
    #  flash[:notice] = "msg sent"
    #else
    #  flash[:alert] = "msg sending error"
    #end
  end


  private

    def user_params
      params.require(:user).permit(:username, :email, 
        :phone_number, :carrier, :password, :latitude, :longitude, :digest, :alert_percent)
    end

    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_path) unless current_user == @user
    end



end
