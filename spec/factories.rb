FactoryGirl.define do

  factory :user do
    # sequence(:username) { |n| "cool hand user #{n}"}
    # sequence(:email) { |n| "user-#{n}@gmail.com"}

    username "jo"
    email "jo@gmail.com"

    password "123"
    password_confirmation "123"

    phone_number	"1234567890"
    carrier		"Bell"
  end


end
