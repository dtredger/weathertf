class WelcomeEmail
  @queue = :welcome_email_queue

  def self.perform(user)
    UserMailer.welcome_email(user).deliver
  end
end
