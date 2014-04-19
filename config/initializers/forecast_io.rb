ForecastIO.api_key = ENV['FORECAST_IO_KEY']


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

  