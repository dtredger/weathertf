require 'spec_helper'

describe UsersController, type: :controller do

  context "#index" do

    it "renders index template" do
      get :index
      response.should render_template :index
    end

  end


  context "#show" do
    
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