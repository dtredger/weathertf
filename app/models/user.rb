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



end
