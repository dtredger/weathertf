require "faker"

FactoryGirl.define do

  factory :user do

    username { Faker::Internet.user_name }
    email { Faker::Internet.email }
    password { Faker::Internet.password }

    factory :full_user do
      phone_number { Faker::PhoneNumber.phone_number}
      carrier { 'some_carrier' }

      latitude { Faker::Address.latitude }
      longitude { Faker::Address.longitude }

      alert_percent 40
      address { Faker::Address.street_address + ", "+ 
        Faker::Address.city + ", " +
        Faker::Address.state_abbr 
      }
    end

  end


end

