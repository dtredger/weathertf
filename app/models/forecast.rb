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


end
