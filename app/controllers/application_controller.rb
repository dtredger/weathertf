class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
	protect_from_forgery with: :exception

	ForecastIO.api_key = '7ae01f0b413da3017237ae750145a642'

	def get_forecast
  		@forecast = ForecastIO.forecast(
			current_user.lat,        	#latitude
			current_user.lon,       	#longitude
			time: Time.now.to_i,  	#new(2013, 7, 31).to_i,
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


end
