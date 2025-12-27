class UserCharacter < ApplicationRecord
  # Relationships
  belongs_to :username
  belongs_to :character
end
