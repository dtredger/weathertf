class WelcomeEmail

  @queue = :email_queue

  def self.perform(user_id)
    user = User.find(user_id)
    UserMailer.welcome_email(user).deliver
  end


end