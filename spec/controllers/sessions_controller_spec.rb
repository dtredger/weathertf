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

      it "stays on index page" do
        response.should redirect_to root_url
      end

      it "flashes error message" do
        flash[:alert].should eq("no")   
      end
    end

    describe "when password accurate" do
      before(:each) do
        @user = create(:default_user)
        post :create, session: { 
          username: "default_user@email.com", 
          password: "default_password"
        } 
      end

      pending "these params are getting rejected" do
        
      
        it "redirects to user's path" do
          response.should redirect_to user_path(@user) 
        end

        it "displays flash welcome" do
          flash[:notice].should eq("welcome") 
        end

      end 

    end
  end

  context "#destroy" do
    before(:each) do
      @user = create(:full_user)
      login_user(@user)
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
    end
  end


end
