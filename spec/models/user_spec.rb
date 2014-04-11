require 'spec_helper'

describe User do

  it "has a valid factory" do
    FactoryGirl.create(:user).should be_valid
  end

  before { @user = FactoryGirl.build(:user) }
  subject { @user }
  
  describe "model has right fields" do
    it { should respond_to(:username) }
    it { should respond_to(:email) }

    it { should respond_to(:password) }
    it { should respond_to(:password_confirmation) }
    it { should respond_to(:crypted_password) }

    it { should respond_to(:phone_number) }
    it { should respond_to(:carrier) }

    it { should respond_to(:latitude) }
    it { should respond_to(:longitude) }
  end

  # describe "phone num too short" do
  #   before { @user.phone_number = 123456789 }
  #   it { should_not be_valid }
  # end

  # describe "no password" do
  #   before { @user.password = @user.password_confirmation = "   " }
  #   it { should_not be_valid }
  # end

  # describe "confirmation doesn't match" do
  #   before { @user.password_confirmation = "different!" }
  #   it { should_not be_valid }
  # end

end

