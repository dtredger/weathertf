class UserTexter < ActionMailer::Base
	include MailerHelper
	default from: "sms@weathertf.com"

	def welcome_text(user)
		@user = user
		mail(to: @user.email, subject: "update")
	end

	def update_text(user)
		@user = user
		number_suffix(@user.carrier)
		get_forecast(user)

		mail(to:"#{@user.phone_number}#{@suffix}", subject: "hi #{@user.username}")
	end

	def number_suffix(carrier)
		case carrier
			when "Bell"
				@suffix = "@txt.bell.ca"
			when "Fido"
				@suffix = "@sms.fido.ca"
			when "Koodo"
				@suffix = "@msg.telus.com"
			when "Wind"
				@suffix = "@txt.windmobile.ca"
			when "Telus"
				@suffix = "@msg.telus.com"
			when "Rogers"
				@suffix = "@sms.rogers.com"
		end
	end





end


# necessary to find the correct phone number suffix amongs the different sms gateways
