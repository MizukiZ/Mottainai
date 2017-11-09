class Profile < ApplicationRecord
  # geocoded_by :area_address
  # after_validation :geocode

  mount_uploader :image, ImageUploader
  belongs_to :user

  validates :first_name, :last_name, :city, presence: true

  def full_name
    "#{first_name}  #{last_name}"
  end

  def nationality_code
    ISO3166::Country.new(nationality)
  end

  def area_address
    "#{city},Australia"
  end
end
