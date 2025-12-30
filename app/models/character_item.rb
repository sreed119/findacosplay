class CharacterItem < ApplicationRecord
  # Relationships
  belongs_to :character
  belongs_to :item

  # Validations
  validates_presence_of :character_id
  validates_presence_of :item_id
  validate :item_is_not_a_duplicate, on: :create

  def already_exists?
    CharacterItem.where(character_id: self.character_id, item_id: self.item_id).size == 1
  end

  private
  def item_is_not_a_duplicate
    return true if self.character_id.nil? || self.item_id.nil?
    if self.already_exists?
      errors.add(:item_id, "This item has already been saved for this character!")
    end
  end
end
