require "spec_helper"

describe UserMailer do
  before(:all) do
    User.delete_all
    @user = create(:full_user)
  end

  describe "welcome_email" do
    before do
      clear_sent_email
      UserMailer.welcome_email(@user.id).deliver
    end

    it "sends to right user" do
      ActionMailer::Base.deliveries.last.to.should eq([@user.email])
    end

    it "only sends one" do
      ActionMailer::Base.deliveries.count.should eq(1)
    end
  end 
  

  describe "daily_forecast_email" do
    before(:each) do
      clear_sent_email
    end

    it "goes to correct user" do
      UserMailer.daily_forecast_email(@user.id).deliver
      ActionMailer::Base.deliveries.last.to.should eq([@user.email])
    end

    it "only sends one" do
      UserMailer.daily_forecast_email(@user.id).deliver
      ActionMailer::Base.deliveries.count.should eq(1)
    end

    it "has correct forecast" do
      forecst_1 = create(:forecast, 
        user_id: @user.id)
      forecst_2 = create(:forecast, 
        user_id: @user.id, 
        summary: "second forecast (newer one)")
      @mail = UserMailer.daily_forecast_email(@user.id).deliver
      @mail.encoded.should include(forecst_2.summary) 
    end
  end


  describe "daily_forecast_text" do
    pending
  end


  describe "reset_password_email" do
    pending
  end 


end
