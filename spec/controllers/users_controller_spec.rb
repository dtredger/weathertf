require 'spec_helper'
Resque.inline = true

describe UsersController do

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
      before(:each) { @user = create(:default_user) } 

      it "returns user's show page" do
        get :show, id: @user.id
        assigns[:user].username.should == "default_user@email.com"
        # response.should redirect_to user_path(@user)
      end

      it "returns welcome message" do
        pending
      end

    end

    describe "un-authenticated users" do
      before { get(:show, {'id'=>'10101'}) }

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


  context "#create" do
    describe "with bad attributes" do
      it "renders index page" do
        expect(post :create, user: attributes_for(:invalid_user)).to redirect_to root_url
      end

      it "shows flash error" do
        post :create, user: attributes_for(:invalid_user)
        flash[:notice].should eq("nope")
      end
    end

    describe "with correct attributes" do
      it "persists user to database" do
        expect{
          post :create, user: attributes_for(:full_user)
        }.to change{User.count}.by(1)
      end

      # figure out how to actually go to user_path(:base_user)...
      # and this test is redundant

      # this test takes like 20seconds
      it "causes 302 redirect" do
        post :create, user: attributes_for(:full_user)
        response.status.should eq(302)
      end

      it "shows welcome message" do
        post :create, user: attributes_for(:full_user)
        flash[:notice].should eq("welcome")
      end

      describe "performs async action" do
        before(:each) do
          ResqueSpec.reset!
        end

        it "queues a welcome email" do
          post :create, user: attributes_for(:full_user)
          WelcomeEmail.should have_queue_size_of(1)
        end

        it "queues a current forecast" do
          post :create, user: attributes_for(:full_user)
          CurrentForecast.should have_queue_size_of(1)
        end
      end
    end

  end


  context "#edit" do
    pending
  end 


  context "#update" do
    pending
  end


  context "#delete" do
    # before :each do 
    #   @user = create(:full_user)
    # end

    it "removes user from database" do
      pending
    end

    it "redirects to index" do
      pending
    end
  end




end