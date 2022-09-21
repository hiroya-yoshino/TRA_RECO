class PostDetail < ApplicationRecord
  belongs_to :post

  has_one_attached :image

  def no_travel_image
    file_path = Rails.root.join('app/assets/images/no_travel_image.jpg')
    image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
  end
end
