class Character < ApplicationRecord
  # Relationships
  has_many :user_characters
  has_many :users, through: :user_characters
  belongs_to :media

  # Enum for hair length
  enum :hair_length, { short: 1, bob: 2, medium: 3, long: 4 }, scopes: true, suffix: true

  # For role dropdown
  HAIR_LENGTHS = [ [ "Short", "short" ], [ "Bob", "bob" ], [ "Medium", "medium" ], [ "Long", "long" ] ]

  # Scopes
  scope :alphabetical, -> { order(:name) }

  # Validations
  validates_presence_of :name

  # Methods
  def hair_type
    if hair_length == "bob"
      hair_color + " " + hair_length
    else
      hair_length + " " + hair_color + " hair"
    end
  end
end
