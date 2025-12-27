class User < ApplicationRecord
  # Relationships
  has_many :user_characters
  has_many :characters, through: :user_characters

  has_many :user_items
  has_many :items, through: :user_items

  has_many :user_media
  has_many :media, through: :user_media
end
