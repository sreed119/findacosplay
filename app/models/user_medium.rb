class UserMedium < ApplicationRecord
  # Relationships
  belongs_to :username
  belongs_to :media
end
