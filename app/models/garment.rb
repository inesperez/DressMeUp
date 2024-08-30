class Garment < ApplicationRecord
  belongs_to :user
  has_many :recommendations
  has_many :outfits, through: :recommendations

  after_commit :process_image_description

  has_one_attached :photo
  # validates :photo, attached: true, content_type: ["image/png", "image/jpg", "image/jpeg"]

  private

  def process_image_description
    ProcessImageDescriptionJob.perform_later(self)
  end
end
