module CharactersHelper
  # helper to pull the list of media for the character form dropdown
  def get_media_options
    Medium.alphabetical.map { |m| [ m.name, m.id ] }
  end
end
