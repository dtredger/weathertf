require "faker"

FactoryGirl.define do

  factory :base_user, class: User do
    email { Faker::Internet.email }
    password { Faker::Internet.password }

    factory :full_user do
      phone_number { Faker::Number.number(10) }
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

