require 'spec_helper'

describe SessionsController do

  context "#create" do
    describe "when password invalid" do
      it "renders page with error" do
        user = create(:default_user)
        post :create, session: { username: user.username, password: 'wrong!' }
        
        expect(flash[:notice]).to match(/^nope/)    
      end
    end

    # describe "when password accurate" do
    #   it "returns http success" do
    #     user = FactoryGirl.create(:default_user)
    #     post :create, session: { username: user.username, password: 'default_password' }
    #     expect(response).to redirect_to user_path(user)
    #     expect(flash[:notice]).to match(/^welcome/)
    #     expect(controller.current_user).to eq user   
    #   end
    # end

  end

  # context "#delete" do
  #   it "returns http success" do
  #     get 'delete'
  #     response.should be_success
  #   end
  # end

end
