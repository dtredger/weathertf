require 'spec_helper'

describe "Index" do
  subject { page }

  it "has default view" do
    visit root_url
    it { should have_selector "button", text: "sign me up please" }
    it { should have_selector "button", text: "login" }
  end

  describe "signup modal" do
    before do 
      visit root_url
      click_button "sign me up please"
    end
    expect(page).to have_selector "input", id: "email"
    # it { should have_selector "input", id: "phone_number" }
  end

end	
