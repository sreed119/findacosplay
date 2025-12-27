class Item < ApplicationRecord
  include Activeable::InstanceMethods
  extend Activeable::ClassMethods

  # Relationships
  has_many :user_items
  has_many :users, through: :user_items

  belongs_to :character

  # Enum for category
  enum :category, { clothing: 1, accessory: 2, prop: 3, wig: 4, contacts: 5, makeup: 6, hat: 7 }, scopes: true, suffix: true

  # For category dropdown
  CATEGORIES = [ [ "Clothing", "clothing" ], [ "Accessory", "accessory" ], [ "Prop", "prop" ], [ "Wig", "wig" ], [ "Contacts", "contacts" ], [ "Makeup", "makeup" ], [ "Hat", "hat" ] ].freeze

  # Scopes
  scope :alphabetical, -> { order(:name) }

  # Validations
  validates_presence_of :name
  validates_presence_of :category
  validates_presence_of :item_link
  validates_presence_of :store
  validates_presence_of :price
  validates_inclusion_of :category, in: %w[clothing accessory prop wig contacts makeup], message: "is not a recognized category in the system"
  validates_format_of :item_link, with: /\A(http)s?:\/\/([^@\s,;]+)\.(com|edu|org|net|gov|mil|biz|info)(\/[^@\s,;]+)*\z/i, message: "is not a valid format"
  validates_numericality_of :price, greater_than_or_equal_to: 0
end
