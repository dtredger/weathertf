FactoryGirl.define do

  factory :user do
    sequence(:name) { |n| "user #{n}"}
    sequence(:email) { |n| "user.#{n}@mail.com"}

    password              "123"
    password_confirmation "123"

    phone_number	"1234567890"
    carrier		"Bell"
    lat		100
    lon		50
  end

end

	