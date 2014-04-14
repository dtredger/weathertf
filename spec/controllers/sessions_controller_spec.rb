require 'spec_helper'

describe SessionsController do

  context "#create" do
    describe "when password invalid" do
      before(:each) do
        user = create(:default_user)
        post :create, session: { 
          username: "default_user@email.com", 
          password: 'wrong!'
        }
      end

      it "renders page with error" do
        pending
      end

      it "flashes error message" do
        pending
        expect(flash[:notice]).to match(/^nope/)    
      end
    end

    describe "when password accurate" do
      before(:each) do
        @user = FactoryGirl.create(:default_user)
      end

      it "returns http success" do
        pending
        login(@user)
        expect(response).to redirect_to user_path(@user)
        expect(flash[:notice]).to match(/^welcome/)
        expect(current_user).to eq @user   
      end
    end
  end

  context "#destroy" do
    before(:each) do
      @user = create(:full_user)
      login_user
      get 'destroy'
    end

    it "redirects user to index" do
      response.should redirect_to root_url
    end

    it "should display logout message" do
      flash[:notice].should eq("logged out")
    end

    it "should delete current_user" do
      pending     
      current_user.should == nil
    end
  end


end
