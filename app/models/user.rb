class User < ActiveRecord::Base
  include FriendlyId

	authenticates_with_sorcery!
	reverse_geocoded_by :latitude, :longitude
  #friendly_id :username, use: :slugged


	validates_presence_of :password, on: :create
	validates_confirmation_of :password


  # not implemented currently, so don't require them
	#validates_presence_of :phone_number
	#validates :phone_number, length: {minimum: 10}, numericality: { only_integer: true }

	#validates_presence_of :carrier

  before_validation :set_username


	after_validation :reverse_geocode		# move into external process?
		# :if => lambda { |user| user.city_changed? }


  private

    def set_username
      self.username = self.email.split("@")[0]
    end


end
