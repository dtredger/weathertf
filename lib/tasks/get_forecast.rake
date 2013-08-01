task :get_forecast => :environment do
  require 'forecast_io'

  ForecastIO.api_key = 'asfdasdfafsd'

  puts ForecastIO.forecast(
    43.648824,        #latitude
    -79.350128,       #longitude
    time: Time.now().to_i,  #new(2013, 7, 31).to_i,
    params: {
      units: 'si',
      exclude: 'flags'
    })


end
