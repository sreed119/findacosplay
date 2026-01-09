class Item < ApplicationRecord
  include Helpers::Deletions
  include Helpers::Activeable::InstanceMethods
  extend Helpers::Activeable::ClassMethods

  # Relationships
  has_many :user_items
  has_many :users, through: :user_items

  has_many :character_items
  has_many :characters, through: :character_items
  has_one_attached :image

  # Enum for category
  enum :category, { clothing: 1, accessory: 2, prop: 3, wig: 4, contacts: 5, makeup: 6, hat: 7 }, scopes: true, suffix: true

  # For category dropdown
  CATEGORIES = [ [ "Clothing", "clothing" ], [ "Accessory", "accessory" ], [ "Prop", "prop" ], [ "Wig", "wig" ], [ "Contacts", "contacts" ], [ "Makeup", "makeup" ], [ "Hat", "hat" ] ].freeze

  # Scopes
  scope :alphabetical, -> { order(:name) }
  scope :search, ->(term) { where("items.name ILIKE ?", "%#{term}%").order("items.name") }
  scope :by_category, ->(category) { where(category: category) }

  # Validations
  validates_presence_of :name
  validates_presence_of :category
  validates :item_link, presence: true, uniqueness: { case_sensitive: true }
  validates_presence_of :store
  validates_presence_of :price
  validates_inclusion_of :category, in: %w[clothing accessory prop wig contacts makeup hat], message: "is not a recognized category in the system"
  validates_format_of :item_link, with: /\A((https?:\/\/)|(www.))([^@\s,;]+)\.(com|edu|org|net|gov|mil|biz|info)(\/[^@\s,;]+)*\z/i, message: "is not a valid format"
  validates_numericality_of :price, greater_than_or_equal_to: 0
end
