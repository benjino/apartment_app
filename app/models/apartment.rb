class Apartment < ApplicationRecord
  belongs_to(:user)
  has_attached_file :image, styles: { small: "64x64", med: "100x100", large: "200x200" }
  validates_attachment :image, presence: true, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] },
  size: { in: 0..10.megabytes }

  geocoded_by :address

  after_validation :geocode

  def address
    "#{street1} #{street2}, #{city}, #{state} #{postalcode}, #{country}"
  end

end
