class Medium < ApplicationRecord
  include Helpers::Deletions

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
  validate :medium_is_not_a_duplicate, on: :create

  def already_exists?
    Medium.where(name: self.name, media_type: self.media_type).size == 1
  end

  # Callbacks
  before_destroy :cannot_destroy_object

  private
  def medium_is_not_a_duplicate
    return true if self.name.nil? || self.media_type.nil?
    if self.already_exists?
      errors.add(:name, "This media (the #{self.media_type} #{self.name}) already exists in the system!")
    end
  end
end
