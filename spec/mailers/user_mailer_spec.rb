require "spec_helper"

describe UserMailer do
  before { clear_sent_email }

  describe "welcome_email" do
    it "sends email to user" do
      post :create, user: attributes_for(:full_user)
      puts last_email
    end
    pending
  end 
  

  describe "daily_email" do
    pending
  end 

  describe "reset_password_email" do
    pending
  end 



end
