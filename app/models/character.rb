class Character < ApplicationRecord
  include Helpers::Deletions

  # Relationships
  has_many :user_characters
  has_many :users, through: :user_characters
  has_many :character_items
  has_many :items, through: :character_items
  belongs_to :medium

  # Enum for hair length
  enum :hair_length, { short: 1, bob: 2, medium: 3, long: 4 }, scopes: true, suffix: true

  # For role dropdown
  HAIR_LENGTHS = [ [ "Short", "short" ], [ "Bob", "bob" ], [ "Medium", "medium" ], [ "Long", "long" ] ]

  # Scopes
  scope :alphabetical, -> { order(:name) }
  scope :for_medium, ->(medium_id) { where("medium_id = ?", medium_id) }
  scope :search, ->(term) { where("characters.name ILIKE ?", "%#{term}%").order("characters.name") }

  # Validations
  validates_presence_of :name
  validates_presence_of :medium_id

  # Callbacks
  before_destroy :cannot_destroy_object

  # Methods
  def hair_type
    if hair_length == "bob"
      hair_color + " " + hair_length
    else
      hair_length + ", " + hair_color + " hair"
    end
  end
end
