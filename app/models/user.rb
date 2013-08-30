class User < ActiveRecord::Base

	authenticates_with_sorcery!


	reverse_geocoded_by :latitude, :longitude


	validates_presence_of :password, on: :create
	validates_confirmation_of :password

	validates_presence_of :phone_number
	validates :phone_number, length: {minimum: 10}, numericality: { only_integer: true }

	validates_presence_of :carrier


	after_validation :reverse_geocode		# move into external process?
		# :if => lambda { |user| user.city_changed? }  


end
