class CurrentForecast
  @queue = :forecast_queue

  def self.perform(user_id)
    user = User.find(user_id)
    Forecast.get_current_forecast(user)
  end

end


class AllForecasts
  @queue = :daily_queue

  def self.perform
    all_users = User.all
    for user in all_users
      Forecast.get_current_forecast(user)
    end
  end
  
end