require 'spec_helper'

describe "Index" do

  it "has default view" do
    visit root_url
    subject { page }
    it { should have_selector "button", text: "sign up" }
    it { should have_selector "button", text: "login" }
  end

  describe "signup modal" do
    before do 
      visit root_url
      click_button "sign up"
    end
    it { should have_selector "input", id: "email" }
    it { should have_selector "input", id: "phone_number" }
  end

end	
