class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :garments
  has_many :outfits
  has_many :recommendations, through: :garments

  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?

  # private

  # def geocode_address
  #   if location_changed?
  #     geocoded = Geocoder.search(location).first
  #     if geocoded
  #       self.latitude = geocoded.latitude
  #       self.longitude = geocoded.longitude
  #       self.address = geocoded.address
  #     end
  #   end
  # end
end
