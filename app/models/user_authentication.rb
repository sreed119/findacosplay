module UserAuthentication 
  extend ActiveSupport::Concern

  included do
    # Use built-in rails support for password protection
    has_secure_password

    # Enum for roles
    enum :role, { admin: 1, user: 2 }, scopes: true, default: :cuser, suffix: true

    # For role dropdown
    ROLES = [['Admin', 'admin'], ['User', 'user']].freeze
  end

  class_methods do
    # login by username
    def authenticate(username, password)
      find_by_username(username).try(:authenticate, password)
    end
  end

end