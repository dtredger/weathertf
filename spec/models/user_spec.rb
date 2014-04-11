require 'spec_helper'

describe User do

  before do 
    @base_user = FactoryGirl.build(:base_user) 
    @full_user = FactoryGirl.build(:full_user) 
  end

  subject { @base_user }
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

  describe "no password" do
    before { @base_user.password = @base_user.password_confirmation = "   " }
    it { should_not be_valid }
  end

    # --- phone number and email ---

  describe "phone number not nil but less than 10 digits" do
    before { @base_user.phone_number = 123456789 }
    it { should_not be_valid }
  end

  describe "phone number but no email" do
    before { @full_user.email = nil }
    it { should be_valid }
  end

  describe "neither email nor phone number" do
    before { @base_user.email = nil }
    it { should_not be_valid }
  end

  # describe "confirmation doesn't match" do
  #   before { @user.password_confirmation = "different!" }
  #   it { should_not be_valid }
  # end

end

