# == Schema Information
#
# Table name: forecasts
#
#  id                :integer          not null, primary key
#  humidity          :float
#  precipIntensity   :float
#  precipProbability :float
#  precipType        :string(255)
#  summary           :string(255)
#  temperature       :float
#  time              :integer
#  visibility        :float
#  latitude          :float
#  longitude         :float
#  user_id           :integer
#  created_at        :datetime
#  updated_at        :datetime
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :forecast do
    humidity 0.8 
    precipIntensity 0.025
    precipProbability 0.06
    precipType "rain"
    summary "it's gon rain!"
    temperature 21.51
    time 1376010000
    visibility 12.54
    latitude 41.5
    longitude -124.5
    user nil
  end
end
