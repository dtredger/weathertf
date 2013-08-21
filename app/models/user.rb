class User < ActiveRecord::Base
	authenticates_with_sorcery!

	validates_presence_of :password, length: {minimum: 3}, on: :create
	validates_confirmation_of :password

	validates_presence_of :phone_number
	validates :phone_number, length: {minimum: 10}, numericality: { only_integer: true }

	validates_presence_of :carrier

end
