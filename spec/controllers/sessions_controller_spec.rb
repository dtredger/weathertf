require 'spec_helper'

describe SessionsController do
  before do
    User.delete_all
    @user = FactoryGirl.create(:default_user, password: 'pass')
  end

  context "#create" do
    describe "when no credentials" do
      it "redirects to index" do
        post :create
        response.should redirect_to "index"
      end
    end


    describe "when password invalid" do
      it "redirects back to index" do
        post :create, session: { 
          username: "default_user@email.com", 
          password: 'wrong!' 
        } 
        # response.should redirect_to "index"
        expect(flash[:alert]).to match(/^username or password incorrect/)    
      end
    end

    describe "when password accurate" do
      it "redirects to users#show" do
        pending
        post :create, 
          session: { username: "default_user@email.com", password: 'pass' } 
        response.should redirect_to user_path(@user)
      end

      it "flashes welcome message" do
        post :create, 
          session: { username: "default_user@email.com", password: 'pass' }
        expect(flash[:notice]).to match(/^welcome/)
      end

      it "sets current user correctly" do
        post :create, 
          session: { username: "default_user@email.com", password: 'pass' }
        expect(current_user).to eq @user   
      end
    end

  end

  context "#delete" do
    it "returns http success" do
      pending
      get 'delete'
      response.should be_success
    end
  end

end
