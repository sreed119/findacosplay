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
  validate :character_is_not_a_duplicate, on: :create

  def already_exists?
    Character.where(name: self.name, medium_id: self.medium_id).size == 1
  end

  # Callbacks
  before_validation :strip_name
  before_destroy :cannot_destroy_object

  # Methods
  def hair_type
    if hair_length == "bob"
      hair_color + " " + hair_length
    else
      hair_length + ", " + hair_color + " hair"
    end
  end

  private
  def strip_name
    self.name = name&.strip
  end

  def character_is_not_a_duplicate
    return true if self.name.nil? || self.medium_id.nil?
    if self.already_exists?
      medium = Medium.find_by(id: self.medium_id)
      errors.add(:name, "This character (#{self.name}, from the #{medium.media_type} #{medium.name}) already exists in the system!")
    end
  end
end
