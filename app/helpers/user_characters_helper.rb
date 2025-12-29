module UserCharactersHelper
  def get_character_options
    Character.alphabetical.map { |c| [ "#{c.name} (#{c.medium.name})", c.id ] }
  end
end
