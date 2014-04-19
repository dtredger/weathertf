# class MorningForecast
#   @queue = :forecast_queue

#   def self.perform(user_id)
#     get_forecast(user_id)
#   end

  
# end


# def get_forecast(user_id)
#   u = User.find(user_id)
#   latitude = u.latitude
#   longitude = u.longitude
#   ForecastIO.forecast(latitude, longitude)
# end

# def parse_forecast(forecast_json)
# end

