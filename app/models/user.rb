class User < ApplicationRecord
  # association
  belongs_to :room
  has_many :posts

  # validation
  validates :room_id, presence: true
  VALID_NAME_REGEX = /\A[\w-]+\z/ # a-z A-Z 0-9 _ -
  validates :name,
    presence: true,
    uniqueness: { case_sensitive: false },
    length: { maximum: 255 },
    format: { with: VALID_NAME_REGEX}
  validates :display_name, length: { maximum: 255 }

  # Devise
  devise :database_authenticatable, :registerable,
    :rememberable, :validatable

  def email_required?
    false
  end

  def will_save_change_to_email?
    false
  end
end
