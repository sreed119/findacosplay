class UserItem < ApplicationRecord
  # Relationships
  belongs_to :user
  belongs_to :item

  # Validations
  validates_presence_of :user_id
  validates_presence_of :item_id
end
