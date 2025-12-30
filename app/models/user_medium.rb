class UserMedium < ApplicationRecord
  # Relationships
  belongs_to :user
  belongs_to :medium

  # Validations
  validates_presence_of :user_id
  validates_presence_of :medium_id
  validate :medium_is_not_a_duplicate, on: :create

  def already_exists?
    UserMedium.where(user_id: self.user_id, medium_id: self.medium_id).size == 1
  end

  private
  def medium_is_not_a_duplicate
    return true if self.user_id.nil? || self.medium_id.nil?
    if self.already_exists?
      medium = Medium.find_by(id: self.medium_id)
      errors.add(:medium_id, "You've already saved #{medium.name}!")
    end
  end
end
