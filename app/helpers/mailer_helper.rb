module MailerHelper

	require 'openssl'
	# OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE

	ForecastIO.api_key = '7ae01f0b413da3017237ae750145a642'

	def get_forecast
  		@forecast = ForecastIO.forecast(
			current_user.latitude,        	#latitude
			current_user.longitude,       	#longitude
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
