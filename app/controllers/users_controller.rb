require "email_workers"
require "forecast_workers"

class UsersController < ApplicationController

  before_filter :correct_user, 
    only: [:show, :edit, :update, :delete]

  respond_to :js, :html

  rescue_from ActiveRecord::RecordNotFound do
    # whats all this then? 
  end


  def index
    @user = User.new
  end

  def show
    @forecasts = @user.forecasts
    @location = @user.location
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      auto_login(@user)
      begin
        Resque.enqueue(WelcomeEmail, @user.id)
        Resque.enqueue(CurrentForecast, @user.id)
      rescue Exception => e
        # some alert: "we'll email you later"
      end
      flash[:notice] = "welcome"
      redirect_to user_path(@user) 
    else
      @user.errors.full_messages.each do |message|
        flash[:alert] = message
      end

      redirect_to root_path
      # TODO 
      # drop-down the sign-up modal automatically, showing errors
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

  def destroy
  end


  def sms

    respond_to do |format|
      format.js
    end

    # TelAPI method
    request_data = { :To => current_user.phone_number, :Body => "Hello from WeatherTF", :Token => ENV['TELAPI_TOKEN'] }
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
      params.require(:user).permit(:email, :phone_number, :carrier, :address,
        :password, :password_confirmation, :latitude, :longitude, :digest, :alert_percent)
    end

    def correct_user
      @user = User.find(params[:id])
      unless current_user == @user then
        redirect_to root_path, alert: "please log in."
      end
    end


end
