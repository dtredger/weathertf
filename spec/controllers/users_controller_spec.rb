require 'spec_helper'

describe UsersController do #, type: :controller do
  #integrates views into tests
  render_views

  before do 
    @base_user = FactoryGirl.build(:base_user) 
    @full_user = FactoryGirl.build(:full_user)
    @invalid_user = FactoryGirl.build(:invalid_user)
    @user = User.create(
      email: "lou@email.com",
      password: 'cats'
      ).save()
  end

  context "#index" do
    it "renders index template" do
      get :index
      response.should render_template :index
    end
  end

  context "#show" do
    # describe "logged-in users" do
    #   before :each do
    #     login_user("lou@email.com", "cats")
    #   end

    #   it "returns show tempate" do
    #     response.should render_template :show
    #   end

    #   it "returns welcome message" do

    #   end

    # end

    describe "un-authenticated users" do
      before { get :show }

      # it "stays on index for un-authenticated" do
      #   response.should render_template :index
      # end

      # it "alerts un-authenticated to log in" do
      #   flash[:notice].should_not be_nil
      # end

    end


  end

  context "#new" do
    
  end

  context "#edit" do
    
  end 



  context "#create" do
    describe "with correct attributes" do
      # expect(post :create, 
      #   user: FactoryGirl.attributes_for(:base_user)
      #   ).to change(User, :count).by(1)  
    end

    describe "with bad attributes" do
      #invalid
    end

  end

  context "#edit" do
  end

  context "#delete" do
    before :each do 
      @user = FactoryGirl.create(:full_user)
    end

    # ...

  end




end