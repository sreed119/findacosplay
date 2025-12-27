class CharacterItem < ApplicationRecord
  # Relationships
  belongs_to :character
  belongs_to :item

  # Validations
  validates_presence_of :character_id
  validates_presence_of :item_id
end
