task :get_forecast => :environment do
  require 'forecast_io'

  ForecastIO.api_key = '7ae01f0b413da3017237ae750145a642'

  # puts ForecastIO.forecast(
  #   43.648824,        #latitude
  #   -79.350128,       #longitude
  #   time: Time.now().to_i,  #new(2013, 7, 31).to_i,
  #   params: {
  #     units: 'si',
  #     exclude: 'flags'
  #   })

puts Time.at(1376022300).to_datetime

end


  # to convert the unix timestamp to datetime:
  # Time.at(1376021760).to_datetime

 # ----------The object returned by Forecast.IO looks like several of these: -------

 # <Hashie::Mash 
 #  cloudCover: 0.67 
 #  dewPoint: 18.3 
 #  humidity: 0.8 
 #  icon: "partly-cloudy-night" 
 #  ozone: 290.75 
 #  precipIntensity: 0.026 
 #  precipProbability: 0.06 
 #  precipType: "rain" 
 #  pressure: 1014.09 
 #  summary: "Mostly Cloudy" 
 #  temperature: 21.69 
 #  time: 1376010000 
 #  visibility: 12.34 
 #  windBearing: 95 
 #  windSpeed: 1.7>,

  