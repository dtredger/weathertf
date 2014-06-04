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


FactoryGirl.define do

  factory :base_user, class: User do
    email "base_user@email.com"
    password "base_password"      
    latitude 40
    longitude -90

    factory :default_user do
      email "default_user@email.com"
      password "default_password"
      latitude 41.0
      longitude -79.0 
    end

    factory :invalid_user do
      email nil
    end

    factory :full_user do
      phone_number 1234567890
      carrier 'telus'
      alert_percent 70
      address "21 fake street, paris, texas"
    end


  end


end

