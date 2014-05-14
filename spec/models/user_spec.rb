# == Schema Information
#
# Table name: users
#
#  id                              :integer          not null, primary key
#  username                        :string(255)      not null
#  email                           :string(255)
#  crypted_password                :string(255)
#  salt                            :string(255)
#  created_at                      :datetime
#  updated_at                      :datetime
#  phone_number                    :integer
#  carrier                         :string(255)
#  latitude                        :float
#  longitude                       :float
#  digest                          :boolean
#  alert_percent                   :integer
#  address                         :string(255)
#  slug                            :string(255)
#  reset_password_token            :string(255)
#  reset_password_token_expires_at :datetime
#  reset_password_email_sent_at    :datetime
#

require 'spec_helper'

describe User do

  before do 
    @base_user = FactoryGirl.build(:base_user) 
    @full_user = FactoryGirl.build(:full_user)
    @invalid_user = FactoryGirl.build(:invalid_user)
    @lou_user = User.create(
      email: "lou@email.com",
      password: 'cats',
      latitude: 100,
      longitude: 53
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
    it { should respond_to(:address) }
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

  context "location" do
    describe "not given" do
      before { @contact_user = FactoryGirl.build(:full_user, latitude: nil, address: nil) }
      subject { @contact_user } 
      it { should_not be_valid }
    end

    describe "has address but no longitude" do
      before { @contact_user = FactoryGirl.build(:full_user, longitude: nil) }
      subject { @contact_user } 
      it { should be_valid }
    end

    describe "address only" do
      before { @contact_user = FactoryGirl.build(:full_user, longitude: nil, latitude: nil) }
      subject { @contact_user } 
      it { should be_valid } 
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
        FactoryGirl.create(:full_user,
          email: "only@email.com",
          password: 'cats'
          )
        email_only = User.find_by_email("only@email.com")
        subject { email_only.username }
        it { should eq("only@email.com") }
      end

      describe "for user with phone number 1112223333 only" do
        FactoryGirl.create(:full_user,
          phone_number: 1112223333,
          email: nil,
          password: 'cats'
          )
        phone_only = User.find_by_phone_number(1112223333)
        subject { phone_only.username }
        it { should eq("1112223333") }
      end

      describe "for user with both email and phone number" do
        FactoryGirl.create(:full_user,
          email: "prefer_email_over_phone@email.com",
          phone_number: 1231231234,
          password: 'cats'
          )
        both = User.find_by_phone_number(1231231234)
        subject { both.username }
        it { should eq("prefer_email_over_phone@email.com") }
      end
    end

  end



end

