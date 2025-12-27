class UserMedium < ApplicationRecord
  # Relationships
  belongs_to :user
  belongs_to :media

  # Validations
  validates_presence_of :user_id
  validates_presence_of :medium_id
end
