class User < ApplicationRecord
  include UserAuthentication

  # Relationships
  has_many :user_characters
  has_many :characters, through: :user_characters

  has_many :user_items
  has_many :items, through: :user_items

  has_many :user_media
  has_many :media, through: :user_media

  # Scopes
  scope :alphabetical, -> { order(:username) }
  scope :admins, -> { where(role: :admin) }
  scope :users, -> { where(role: :user) }

  # Validations
  validates :username, presence: true, uniqueness: { case_sensitive: false }
  validates_presence_of :role
  validates_inclusion_of :role, in: %w[admin user], message: "is not a recognized role in the system"
  validates_presence_of :password, on: :create
  validates_presence_of :password_confirmation, on: :create
  validates_confirmation_of :password, on: :create, message: "does not match"
  validates_length_of :password, minimum: 6, message: "must be at least 6 characters long", allow_blank: true
end
