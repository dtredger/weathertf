ActionMailer::Base.smtp_settings = {
	address: "smtp.gmail.com",
	port: 587,
	# domain: "coolmail.com",
	# user_name: "chuckTesta",
	# password: "nope!",
	authentication: "plain",
	enable_starttls_auto: true
}

# http://railscasts.com/episodes/206-action-mailer-in-rails-3?autoplay=true
# (don't use this in production...)
