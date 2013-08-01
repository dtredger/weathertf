task :get_forecast => :environment do
	require 'forecast_io'

	ForecastIO.api_key = '7ae01f0b413d3127237ae750145a642'

	puts ForecastIO.forecast(43.648824, -79.350128)


end
