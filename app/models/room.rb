class Room < ApplicationRecord

  # validation
  VALID_CODE_REGEX = /\A[\w-]+\z/ # a-z A-Z 0-9 _ -
  validates :code,
    presence: true,
    uniqueness: true,
    length: { in: 8..255 },
    format: { with: VALID_CODE_REGEX}

end
