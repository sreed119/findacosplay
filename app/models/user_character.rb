class UserCharacter < ApplicationRecord
  # Relationships
  belongs_to :user
  belongs_to :character

  # Validations
  validates_presence_of :user_id
  validates_presence_of :character_id
  validate :character_is_not_a_duplicate, on: :create

  def already_exists?
    UserCharacter.where(user_id: self.user_id, character_id: self.character_id).size == 1
  end

  private
  def character_is_not_a_duplicate
    return true if self.user_id.nil? || self.character_id.nil?
    if self.already_exists?
      character = Character.find_by(id: self.character_id)
      errors.add(:character_id, "You've already saved #{character.name}!")
    end
  end
end
