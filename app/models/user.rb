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

class User < ActiveRecord::Base
  has_many :forecasts
  
  authenticates_with_sorcery!

  validates_presence_of :password, on: :create
  validates_confirmation_of :password
  validates :phone_number, 
    length: { minimum: 10 }, 
    numericality: { only_integer: true },
    allow_blank: true
  validate :email_or_phone_number
  validates_uniqueness_of :email, allow_blank: true
  validate :address_or_coordinates
  
  # after_validation :geocode_with_given_attrs #, :if => :####?

  before_save :create_username


  private

    def email_or_phone_number
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

    def geocode_with_given_attrs
      binding.pry
      if !(latitude.blank? and longitude.blank?)
        reverse_geocoded_by :latitude, :longitude
      elsif !(address.blank?)
        geocoded_by :address        
      end
    end

    def address_or_coordinates
      if (latitude.blank? or longitude.blank?)
        validates_presence_of :address
      else
        validates_presence_of :latitude, numericality: true
        validates_presence_of :longitude, numericality: true
      end
    end


end
