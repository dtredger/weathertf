# class WeatherWorker
# 	include Sidekiq::Worker
# 	include ApplicationHelper

# 	def watch_weather(user)
# 		time_to_mail = 0
# 		user_prob = user_prob

# 		@future_hrs.each do |hr|
# 			if hr.precipProbability >= user_prob
# 				time_to_mail = hr.time
# 				return
# 			end
# 		end

# 	end

# 	if Time.now.to_i == time_to_mail
# 		# send mail
# 	end


# end

