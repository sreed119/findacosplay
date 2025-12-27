class Medium < ApplicationRecord
  # Relationships
  has_many :user_media
  has_many :users, through: :user_media
  has_many :characters
end
