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

class Forecast < ActiveRecord::Base
  belongs_to :user

  validates :time,
    length: { minimum: 10 }, 
    numericality: { only_integer: true },
    allow_blank: false
  validates :latitude,
    numericality: true
  validates :longitude,
    numericality: true



  def self.get_current_forecast(user)
    @forecast = ForecastIO.forecast(
      user[:latitude],         
      user[:longitude],         
      time: Time.now.to_i,
      params: {
        units: 'si',
        exclude: 'flags'
      })    
    @hourly = @forecast.hourly.data
    @daily = @forecast.daily.data.first
    @future_hrs = []
    @hourly.each do |h|
      if h.time > Time.now.to_i
        @future_hrs << h
      end
    end

    user.forecasts.create(
      time: @forecast[:currently][:time],
      latitude: @forecast[:latitude],
      longitude: @forecast[:longitude],
      precipIntensity: @forecast[:currently][:precipIntensity],  
      precipProbability: @forecast[:currently][:precipProbability],
      precipType: @forecast[:currently][:precipType],
      humidity: @forecast[:currently][:humidity],
      temperature: @forecast[:currently][:temperature],
      visibility: @forecast[:currently][:visibility],
      summary: @forecast[:currently][:summary]
    )
  end


end

