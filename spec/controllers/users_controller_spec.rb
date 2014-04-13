require 'spec_helper'

describe UsersController do

  before(:each) do 
  end


  context "404" do
    describe "for logged-in users" do
      it "redirects to show page" do
        pending
      end
    end

    describe "for un-authenticated users" do
      # before { get "/crazypage" }

      it "redirects to index" do
        pending
        # response.should redirect_to :index
      end

      it "shows flash error" do
        pending
        # flash[:notice].should eq("nope")
      end
    end
  end

  context "#index" do
    it "renders index template" do
      get :index
      response.should render_template :index
    end

    it "responds with 200" do
      get :index
      response.status.should eq(200)
    end
  end


  context "#show" do
    describe "logged-in users" do
      before(:each) do
        @user = User.create(email: 'test@email.co', password: '1', password_confirmation: '1')
        login_user(@user)
        get :index
      end

      it "returns user's show page" do
        get :show, id: @user.id
        assigns[:user].username.should == 'test@email.co'
        # response.should redirect_to user_path(@user)
      end

      it "returns welcome message" do
        pending
      end

    end

    describe "un-authenticated users" do
      before { get(:show, {'id'=>'21'}) }

      it "stays on index for un-authenticated" do
        # response.should render_template :index
        pending
      end

      it "alerts un-authenticated to log in" do
        # flash[:notice].should_not be_nil
        pending
      end

    end
  end


  context "#new" do
    pending
  end


  context "#edit" do
    pending
  end 


  context "#create" do

    describe "with correct attributes" do
      before do
        post :create, user: attributes_for(:full_user)
      end

      it "persists user to database" do
        pending
      end

      # figure out how to actually go to user_path(:base_user)...
      # and this test is redundant

      # this test takes like 20seconds
      it "causes 302 redirect" do
        response.status.should eq(302)
      end

      it "shows welcome message" do
        flash[:notice].should eq("welcome")
      end
    end

    describe "with bad attributes" do
      before do
        post :create, user: attributes_for(:invalid_user)
      end
      
      it "renders index page" do
        pending
        # response.should redirect_to :index
      end

      it "shows flash error" do
        flash[:notice].should eq("nope")
      end
    end

  end

  context "#update" do
  end

  context "#delete" do
    pending
    # before :each do 
    #   @user = create(:full_user)
    # end


  end




end