class User < ActiveRecord::Base
  
  authenticates_with_sorcery!

  validates_presence_of :password, on: :create
  validates_confirmation_of :password
  validates :phone_number, 
    length: { minimum: 10 }, 
    numericality: { only_integer: true },
    allow_blank: true
  validate :email_xor_phone_number
  validates_uniqueness_of :email,
    allow_blank: true

  before_save :create_username
  
  reverse_geocoded_by :latitude, :longitude


  private

    def email_xor_phone_number
      if (email.blank?)
        validates_presence_of :phone_number
      else
        validates_presence_of :email
      end
    end

    def create_username
      if !(email.blank?)
        self.username = email
      else
        self.username = phone_number.to_s
      end
    end

    def get_current_forecast
      require 'forecast_io'
      @forecast = ForecastIO.forecast(
        current_user.latitude,          #latitude
        current_user.longitude,         #longitude
        time: Time.now.to_i,    #new(2013, 7, 31).to_i,
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
    end



end
