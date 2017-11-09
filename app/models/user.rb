class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_one :profile, dependent: :destroy
  has_one :upgrade, dependent: :destroy
  has_many :messages
  has_many :items, dependent: :destroy
  has_many :comments, foreign_key: :recipient_id, class_name: "Comment"

  def name
    profile.first_name
  end

  def has_profile?
    profile.present?
  end

  def premium?
    profile.premium == true
  end

end
