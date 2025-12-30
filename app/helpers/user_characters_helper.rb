module UserCharactersHelper
  def get_character_options(user = current_user)
    return [] unless user

    saved_characters = user.user_characters.select(:character_id)
    Character.alphabetical.where.not(id: saved_characters).includes(:medium).map { |c| [ "#{c.name} (#{c.medium.name})", c.id ] }
  end
end
