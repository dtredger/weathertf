module UserMailerSpecHelper

	def last_email
		ActionMailer::Base.deliveries.last
	end

	def clear_sent_email
		ActionMailer::Base.deliveries = []
	end

end
