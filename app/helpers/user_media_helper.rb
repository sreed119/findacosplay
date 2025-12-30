module UserMediaHelper
  def get_medium_options(user = current_user)
    return [] unless user

    saved_media = user.user_media.select(:medium_id)
    Medium.alphabetical.where.not(id: saved_media).map { |m| [ m.name, m.id ] }
  end
end
