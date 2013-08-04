class UserTexter < ActionMailer::Base
  default from: "cool@example.com"

  def welcome_text(user)
  	@user = user
  	mail(to: "!!!!", subject: "hello")
  end


end


# necessary to find the correct phone number suffix amongs the different sms gateways
