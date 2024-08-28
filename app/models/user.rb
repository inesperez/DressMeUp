class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :garments
  has_many :outfits
  has_many :recommendations, through: :garments

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?


  private

  def geocode_address
    if address_changed?
      geocoded = Geocoder.search(address).first
      if geocoded
        self.address = geocoded.address
      end
    end
  end
end
