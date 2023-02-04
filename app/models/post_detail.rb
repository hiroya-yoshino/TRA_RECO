class PostDetail < ApplicationRecord
  belongs_to :post
  geocoded_by :address
  after_validation :geocode, if: :address_changed?

  has_many_attached :images

  validates :spot_name, presence: true

  def no_travel_image
    file_path = Rails.root.join('app/assets/images/no_travel_image.jpg')
    image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
  end
end
