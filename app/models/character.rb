class Character < ApplicationRecord
  # Relationships
  has_many :user_characters
  has_many :users, through: :user_characters
  belongs_to :media
end
