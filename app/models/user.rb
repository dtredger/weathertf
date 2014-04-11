class User < ActiveRecord::Base
  #include FriendlyId

  authenticates_with_sorcery!
  reverse_geocoded_by :latitude, :longitude
  #friendly_id :username, use: :slugged

  validates_presence_of :password, on: :create
  validates_confirmation_of :password


  #validates_presence_of :phone_number
  validates :phone_number, 
    length: { minimum: 10 }, 
    numericality: { only_integer: true },
    allow_blank: true

  validate :email_xor_phone_number

  validates_uniqueness_of :email,
    allow_blank: true
    
  #validates_presence_of :carrier


  # after_validation :reverse_geocode   # move into external process?
    # :if => lambda { |user| user.city_changed? }


  private

    def email_xor_phone_number
      if (email.blank?)
        validates_presence_of :phone_number
      else
        validates_presence_of :email
      end
    end



end
