class CurrentForecast
  @queue = :forecast_queue

  def self.perform(user_id)
    u = User.find(user_id)
    Forecast.get_current_forecast(u)
  end


end
