class WelcomeEmail
  @queue = :email_queue

  def self.perform(user_id)
    user = User.find(user_id)
    UserMailer.welcome_email(user).deliver
  end

end






class DailyForecastEmail
  @queue = :email_queue

  def self.perform(user_id)
    user = User.find(user_id)
    UserMailer.daily_forecast_email(user).deliver
  end

end


class ForecastText
  @queue = :email_queue

  def self.perform(user_id)
    user = User.find(user_id)
    UserMailer.daily_forecast_text(user).deliver
  end

end