module ApplicationHelper

  ForecastIO.api_key = '7ae01f0b413da3017237ae750145a642'

  def get_forecast
    @forecast = ForecastIO.forecast(
    current_user.lat,           #latitude
    current_user.lon,           #longitude
    time: Time.now.to_i,    #new(2013, 7, 31).to_i,
    params: {
        units: 'si',
        exclude: 'flags'
    })
    @hourly = @forecast.hourly.data
    @daily = @forecast.daily.data.first
  end

  def full_title(page_title)
    base_title = "WeatherTF"
    if page_title.empty?
      base_title
    else
      "#{base_title} - #{page_title}"
    end
  end

  def random_bg
    @background = [image_path("1.jpg"),image_path("2.jpg"),image_path("3.jpg"),].sample
  end

end
