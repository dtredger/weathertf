# todo - consider breaking this into separate mailers for account related 
# tasks, and the actual forecast/text tasks

class UserMailer < ActionMailer::Base
  include MailerHelper
  default from: "sms@WeatherTF.com"


  def welcome_email(user_id)
    @user = User.find(user_id)
    mail(to: @user.email, subject: "hello")
  end



  def daily_forecast_email(user_id)
    @user = User.find(user_id)
    @latest_forecast = @user.forecasts.last
    mail(
      to:"#{@user.email}", 
      subject: "forecast for #{Date.today}")
  end


  def daily_forecast_text(user_id)
    @user = User.find(user_id)
    @suffix = number_suffix(@user.carrier)
    get_forecast(user)
    mail(
      to:"#{@user.phone_number}#{@suffix}", 
      subject: "hi #{@user.username}")
  end



  # necessary to find the correct phone number suffix amongs the different sms gateways
  def number_suffix(carrier)
    case carrier
      when "Bell"
        return "@txt.bell.ca"
      when "Fido"
        return "@sms.fido.ca"
      when "Koodo"
        return "@msg.telus.com"
      when "Wind"
        return "@txt.windmobile.ca"
      when "Telus"
        return "@msg.telus.com"
      when "Rogers"
        return "@sms.rogers.com"
    end
  end


  def reset_password_email(user)
    # if using redis, won't above user have to be an id only, 
    # which we will look up here?
    @user = user
    @url = edit_password_reset_url(user.reset_password_token)
    mail(to:@user.email, subject: "Reset password")
  end



end


