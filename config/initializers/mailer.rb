ActionMailer::Base.smtp_settings = {
	address: "smtp.gmail.com",
	port: 587,
	domain: "gmail.com",
	user_name: "d.tredger",
	password: "Byte2261",
	authentication: "plain",
	enable_starttls_auto: true
}

# http://railscasts.com/episodes/206-action-mailer-in-rails-3?autoplay=true
# (don't use this in production...)


#  GMAIL doesn't appear to like when you sign up and immediately try to send messages like this:
# my actual gmail account works fine for sending.
