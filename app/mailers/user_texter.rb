class UserTexter < ActionMailer::Base
  default from: "cool@example.com"

	def welcome_text(user)
		@user = user
		mail(to: @user.email, subject: "hello")
	end

	def update_text(user)
		@user = user
		mail(to:@user.email, subject: "Instant Update")
	end


end


# necessary to find the correct phone number suffix amongs the different sms gateways
