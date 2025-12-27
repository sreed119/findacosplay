class UserItem < ApplicationRecord
  # Relationships
  belongs_to :username
  belongs_to :item
end
