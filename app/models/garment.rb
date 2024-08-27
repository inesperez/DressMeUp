class Garment < ApplicationRecord
  belongs_to :user
  has_many :recommendations
  has_many :outfits, through: :recommendations
end
