class Garment < ApplicationRecord
  belongs_to :user
  has_many :recommendations
end
