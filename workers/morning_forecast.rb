require 'forecast_io'

class MorningForecast
  @queue = :forecast_queue

  def self.perform(user_id)
    get_forecast(user_id)
  end
end


def get_forecast(user_id)
  u = User.find(user_id)
  latitude = u.latitude
  longitude = u.longitude
  ForecastIO.forecast(latitude, longitude)
end

def parse_forecast(forecast_json)
end

def get_current_forecast
  @forecast = ForecastIO.forecast(
    current_user.latitude,          #latitude
    current_user.longitude,         #longitude
    time: Time.now.to_i,    #new(2013, 7, 31).to_i,
    params: {
      units: 'si',
      exclude: 'flags'
    })
  
  @hourly = @forecast.hourly.data
  @daily = @forecast.daily.data.first

  @future_hrs = []

  @hourly.each do |h|
    if h.time > Time.now.to_i
      @future_hrs << h
    end
  end
end