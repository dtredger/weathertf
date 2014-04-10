# require 'spec_helper'

# describe "Index /" do

#   describe "invalid signin" do
#     before { click_button "Sign in" }

#     it { should have_selector "title", text: "sign in" }
#     it { should have_selector "div.alert.alert-error", text: "nope! chuck testa" }

#     describe "after visiting another page" do
#       before { click_link "home" }
#       it { should_not have_selector "div.alert" }
#     end
#   end

#   describe "valid signin" do
#     let(:user) { FactoryGirl.create(:user) }
#     before { sign_in user }

#     it { should have_selector "title", text: user.name }
#     it { should have_link "profile", href: user_path(user) }
#     it { should have_link "sign out", href: signout_path }
#     it { should have_link "settings", href: edit_user_path(user) }
#     it { should_not have_link "sign in", href: signin_path }


#     describe "- then signout" do
#       before { click_link "sign out"}
#       it { should have_link "sign in"}
#     end
#   end

# end


# describe "authorization *" do

#   describe "for non-signed-in users *" do
#     let(:user) { FactoryGirl.create(:user) }

#     describe "in Users controller *" do

#       describe "visit edit page" do
#         before { visit edit_user_path(user) }
#         it { should have_selector "title", text: "sign in" }
#       end

#       describe "submit update" do
#         before { put user_path(user) }
#         specify { response.should redirect_to(signin_path) }
#       end

#       describe "visiting the user index" do
#         before { visit users_path }
#         it { should have_selector "title", text: "sign in"}
#       end
#     end

#     describe "when attempting to visit protected page" do
#       before do
#         visit edit_user_path(user)
#         fill_in "Email", with: user.email
#         fill_in "Password", with: user.password
#         click_button "Sign in"
#       end

#       describe "after signing in" do
#         it "should render the protected page" do
#           page.should have_selector "title", text: "edit user"
#         end
#       end
#     end

#     describe "in microposts controller *" do

#       describe "submit to create action" do
#         before {post microposts_path }
#         specify { response.should redirect_to(signin_path) }
#       end

#       describe "submit to destroy action" do
#         before { delete micropost_path(FactoryGirl.create(:micropost)) }
#         specify { response.should redirect_to(signin_path) }
#       end
#     end

#   end

#   describe "as wrong user *" do
#     let(:user) { FactoryGirl.create(:user) }
#     let(:wrong_user) { FactoryGirl.create(:user, email: "wrong@eg.com") }
#     before { sign_in user }

#     describe "visit Users#edit" do
#       before { visit edit_user_path(wrong_user) }
#       it { should_not have_selector "title", text: full_title("edit user") }
#     end

#     describe "submit PUT to Users#update" do
#       before { put user_path(wrong_user) }
#       specify { response.should redirect_to(root_path) }
#     end
#   end

# end

# describe "with valid information" do
#   let(:user) { FactoryGirl.create(:user) }
#   before { sign_in user }

#   it { should have_selector "title", text: user.name }

#   it { should have_link "users", href: users_path }
#   it { should have_link "profile", href: user_path(user) }
#   it { should have_link "settings", href: edit_user_path(user) }
#   it { should have_link "sign out", href: signout_path }

#   it { should_not have_link "sign in", href: signin_path }
# end

# describe "as non-admin user -" do
#   let(:user) { FactoryGirl.create(:user) }
#   let(:non_admin) { FactoryGirl.create(:user) }
#   before { sign_in non_admin }

#   describe "submit DELETE to Users#destroy" do
#     before { delete user_path(user) }
#     specify { response.should redirect_to(root_path) }
#   end
# end