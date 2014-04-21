require 'spec_helper'

describe SessionsController do

  context "#create" do
    describe "when password invalid" do
      it "renders page with error" do
        pending
        user = create(:default_user)
        post :create, session: { username: user.username, password: 'wrong!' }
        
        expect(flash[:notice]).to match(/^nope/)    
      end
    end

    describe "when password accurate" do
      before(:each) do
        @user = FactoryGirl.create(:default_user)
      end

      it "returns http success" do
        pending
        # expect(response).to redirect_to user_path(user)
        # expect(flash[:notice]).to match(/^welcome/)
        # expect(current_user).to eq @user   
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
