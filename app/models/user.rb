class User < ActiveRecord::Base

	authenticates_with_sorcery!

	# reverse_geocoded_by :lat, :lon



	validates_presence_of :password, on: :create
	validates_confirmation_of :password

	validates_presence_of :phone_number
	validates :phone_number, length: {minimum: 10}, numericality: { only_integer: true }

	validates_presence_of :carrier



	after_validation :geocode  # move into external process?

end
