require 'spec_helper'

describe UsersController do

  before(:each) do 
    
    
    # @user = User.create(
    #   email: "lou@email.com",
    #   password: 'cats'
    #   ).save()
  end

  context "#index" do
    it "renders index template" do
      get :index
      response.should render_template :index
    end
  end

  context "#show" do
    describe "logged-in users" do
      before :each do
        @default_user = FactoryGirl.build(:default_user)
        login_user(@default_user)
      end

      # it "returns show tempate" do
      #   response.should redirect_to(:user_path)
      # end

      # it "returns welcome message" do

      # end

    end

    # describe "un-authenticated users" do
    #   before { get(:show, {'id'=>'21'}) }

    #   it "stays on index for un-authenticated" do
    #     response.should render_template :index
    #   end

    #   it "alerts un-authenticated to log in" do
    #     flash[:notice].should_not be_nil
    #   end

    # end
  end

  context "#new" do
  end

  context "#edit" do
  end 


  context "#create" do

    describe "with correct attributes" do
      before do
        post :create, user: attributes_for(:full_user)
      end

      # it "persists user to database" do
      #   #something
      # end

      # figure out how to actually go to user_path(:base_user)...
      # and this test is redundant

      # this test takes like 20seconds
      # it "causes 302 redirect" do
      #   response.status.should eq(302)
      # end

      it "shows welcome message" do
        flash[:notice].should eq("welcome")
      end
    end

    describe "with bad attributes" do
      before do
        @invalid_user_attrs = attributes_for(:invalid_user)
        post :create, user: @invalid_user_attrs
      end
      
      it "renders index page" do
        response.should render_template :index
      end

      it "shows flash error" do
        flash[:notice].should eq("nope")
      end
    end

  end

  context "#edit" do
  end

  # context "#delete" do
  #   before :each do 
  #     @user = create(:full_user)
  #   end

  #   # ...

  # end




end