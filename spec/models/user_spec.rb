require 'spec_helper'

describe User do

  before do 
    @base_user = FactoryGirl.build(:base_user) 
    @full_user = FactoryGirl.build(:full_user)
    @lou_user = User.create(
      email: "lou@email.com",
      password: 'cats'
      ).save()
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


  describe "password" do
    describe "does not exist" do
      before { @base_user.password = @base_user.password_confirmation = "   " }
      it { should_not be_valid }
    end

    describe "does not match confirmation" do
      before { @base_user.password_confirmation = "different!" }
      it { should_not be_valid }
    end
  end

  
  describe "contact info - " do
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

    describe "email already used" do
      before do
        @duplicate_lou_user = User.create(
          password: 'somethin', 
          email: "lou@email.com"
          )
      end
      subject { @duplicate_lou_user }
      it { should_not be_valid }
      it { should have(1).errors_on(:email) }
    end

    describe "username created by system" do
      subject { @lou_user }
      it { should have username == "lou@email.com"}
    end
  end



end

