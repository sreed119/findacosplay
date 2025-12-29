class Medium < ApplicationRecord
  # Relationships
  has_many :user_media
  has_many :users, through: :user_media
  has_many :characters

  # Enum for media type
  enum :media_type, { animanga: 1, game: 3, cartoon: 4, movie: 5, tv_show: 6 }, scopes: true, suffix: true

  # For media type dropdown
  MEDIA_TYPES = [ [ "AniManga", "animanga" ], [ "Game", "game" ], [ "Cartoon", "cartoon" ], [ "Movie", "movie" ], [ "TV Show", "tv_show" ] ].freeze

  # Scopes
  scope :alphabetical, -> { order(:name) }
  scope :search, ->(term) { where("media.name ILIKE ?", "%#{term}%").order("media.name") }

  # Validations
  validates_presence_of :name
  validates_presence_of :media_type
  validates_inclusion_of :media_type, in: %w[animanga game cartoon movie tv_show], message: "is not a recognized media type in the system"
end
