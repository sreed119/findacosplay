class Item < ApplicationRecord
  # Relationships
  has_many :user_items
  has_many :users, through: :user_items
  
  belongs_to :character
end
