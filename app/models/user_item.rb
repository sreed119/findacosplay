class UserItem < ApplicationRecord
  # Relationships
  belongs_to :user
  belongs_to :item

  # Enum for rating
  enum :rating, { one_star: 1, two_stars: 2, three_stars: 3, four_stars: 4, five_stars: 5 }, scopes: true, suffix: true

  # For rating dropdown
  RATINGS = [ [ "1 Star", "one_star" ], [ "2 Stars", "two_stars" ], [ "3 Stars", "three_stars" ], [ "4 Stars", "four_stars" ], [ "5 Stars", "five_stars" ] ].freeze

  # Validations
  validates_presence_of :user_id
  validates_presence_of :item_id
  validates_inclusion_of :rating, in: %w[one_star two_stars three_stars four_stars five_stars], message: "is not a recognized rating in the system", allow_nil: true
  validate :item_is_not_a_duplicate, on: :create

  def already_exists?
    UserItem.where(user_id: self.user_id, item_id: self.item_id).size == 1
  end

  private
  def item_is_not_a_duplicate
    return true if self.user_id.nil? || self.item_id.nil?
    if self.already_exists?
      errors.add(:item_id, "You've already saved this item!")
    end
  end
end
