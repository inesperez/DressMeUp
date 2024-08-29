class Garment < ApplicationRecord
  belongs_to :user
  has_many :recommendations
  has_many :outfits, through: :recommendations

  has_one_attached :photo
  # validates :photo, attached: true, content_type: ["image/png", "image/jpg", "image/jpeg"]
end
