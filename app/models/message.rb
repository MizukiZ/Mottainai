class Message < ApplicationRecord
  mount_uploader :image, ImageUploader
  belongs_to :user
  belongs_to :conversation, touch: true
  validates :body, presence: true, unless: :image_present?

  def time_format
    created_at.strftime("%m/%d at %l:%M %p")
  end

  def image_present?
    image.present?
  end

end
