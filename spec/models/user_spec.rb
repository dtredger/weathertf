require 'spec_helper'

describe User do

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
    it { should respond_to(:lat) }
    it { should respond_to(:lon) }

    it { should be_valid }
  end

  describe "phone num too short" do
    before { @user.phone_number = 123456789 }

    it { should_not be_valid }
  end

end

  describe "no password" do
    before { @user.password = @user.password_confirmation = " " }
    it { should_not be_valid }
  end

#   describe "password too short" do
#     before { @user.password = @user.password_confirmation = "a" * 5 }
#     it { should be_invalid }
#   end

#   describe "confirmation doesn't match password" do
#     before { @user.password_confirmation = "mismatch" }
#     it { should_not be_valid }
#   end

#   describe "confirmation set to nil" do
#     before { @user.password_confirmation = nil }
#     it { should_not be_valid }
#   end


#   describe "return value of authenticate" do
#     before { @user.save }
#     let(:found_user) { User.find_by_email(@user.email) }

#     describe "with valid password" do
#       it { should == found_user.authenticate(@user.password) }
#     end

#     describe "invalid password" do
#       let(:user_for_invalid_password) { found_user.authenticate("invalid") }

#       it { should_not == user_for_invalid_password }
#       specify { user_for_invalid_password.should be_false }
#     end
#   end


#   describe "remember token" do
#     before { @user.save }
#     its(:remember_token) { should_not be_blank }
#   end

#   describe "with admin set to 'true' -" do
#     before do
#       @user.save!
#       @user.toggle!(:admin)
#     end

#     it { should be_admin }
#   end

#   describe "micropost associations -" do
#     before { @user.save }
#     let!(:older_micropost) do
#       FactoryGirl.create(:micropost, user: @user, created_at: 1.day.ago)
#     end
#     let!(:newer_micropost) do
#       FactoryGirl.create(:micropost, user: @user, created_at: 1.hour.ago)
#     end

#     it "should have newest post first" do
#       @user.microposts.should == [newer_micropost, older_micropost]
#     end

#     it "should destroy associated microposts" do
#       microposts = @user.microposts.dup
#       @user.destroy

#       microposts.should_not be_empty
#       microposts.each do |micropost|
#         Micropost.find_by_id(micropost.id).should be_nil
#       end
#     end

#     describe "status" do
#       let(:unfollowed_post) do
#         FactoryGirl.create(:micropost, user: FactoryGirl.create(:user) )
#       end

#       its(:feed) { should include(newer_micropost) }
#       its(:feed) { should include(older_micropost) }
#       its(:feed) { should_not include(unfollowed_post) }
#     end

#   end



# end