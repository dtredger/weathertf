require 'spec_helper'

describe User do

  before do 
    @base_user = FactoryGirl.build(:base_user) 
    @full_user = FactoryGirl.build(:full_user)
    @invalid_user = FactoryGirl.build(:invalid_user)
    @lou_user = User.create(
      email: "lou@email.com",
      password: 'cats'
      ).save()
  end

  context "model" do
    subject { @base_user }
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


  context "password" do
    describe "does not exist" do
      before { @base_user.password = @base_user.password_confirmation = "   " }
      it { should_not be_valid }
    end

    describe "does not match confirmation" do
      before { @base_user.password_confirmation = "different!" }
      it { should_not be_valid }
    end
  end
  

  context "contact" do
    describe "phone number not nil but less than 10 digits" do
      before { @base_user.phone_number = 123456789 }
      it { should_not be_valid }
    end

    describe "phone number but no email" do
      before { @full_user.email = nil }
      subject { @full_user }
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

    context "username created by system" do
      describe "for user with only@email.com" do
        User.create(
          email: "only@email.com",
          password: 'cats'
          ).save()
        email_only = User.find_by_email("only@email.com")
        subject { email_only.username }
        it { should eq("only@email.com") }
      end

      describe "for user with phone number 1112223333 only" do
        User.create(
          phone_number: 1112223333,
          password: 'cats'
          ).save()
        phone_only = User.find_by_phone_number(1112223333)
        subject { phone_only.username }
        it { should eq("1112223333") }
      end

      describe "for user with both email and phone number" do
        User.create(
          email: "prefer_email_over_phone@email.com",
          phone_number: 1231231234,
          password: 'cats'
          ).save()
        both = User.find_by_phone_number(1231231234)
        subject { both.username }
        it { should eq("prefer_email_over_phone@email.com") }
      end
    end

  end



end

