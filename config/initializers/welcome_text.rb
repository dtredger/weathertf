ActionMailer::Base.smtp_settings = {
	address: "smtp.gmail.com",
	port: 587,
	domain: "gmail.com",
	user_name: "weathertf.via",       # seems to be wrong ... :E
	password: "weathertf123",
	authentication: "plain",
	enable_starttls_auto: true
}

# http://railscasts.com/episodes/206-action-mailer-in-rails-3?autoplay=true
# (don't use this in production...)
