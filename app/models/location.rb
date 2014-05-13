# == Schema Information
#
# Table name: locations
#
#  id         :integer          not null, primary key
#  created_at :datetime
#  updated_at :datetime
#  latitude   :float
#  longitude  :float
#  address    :string(255)
#  user_id    :integer
#

class Location < ActiveRecord::Base
  belongs_to :user

  reverse_geocoded_by :latitude, :longitude
  
  validate :address_or_coordinates
    
  after_validation :reverse_geocode

  private

    def address_or_coordinates
      if (latitude.blank? or longitude.blank?)
        validates_presence_of :address
      else
        validates_presence_of :latitude, numericality: true
        validates_presence_of :longitude, numericality: true
      end
    end
end



# class ForwardLocation < Location
#   geocoded_by :address
#   after_validation :geocode

# end


# class ReverseLocation < Location
#   reverse_geocoded_by :latitude, :longitude,
#     address: :address
#   after_validation :reverse_geocode
  
# end
