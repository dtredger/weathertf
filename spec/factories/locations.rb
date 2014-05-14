# == Schema Information
#
# Table name: locations
#
#  id         :integer          not null, primary key
#  created_at :datetime
#  updated_at :datetime
#  latitude   :float
#  longitude  :float
#  address    :string(255)
#  user_id    :integer
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :location do
    latitude 41.5
    longitude -124.5
    address "some street address"
    user nil
  end
end
