module UserItemsHelper
  # helper to pull the list of media for the character form dropdown
  def get_unsaved_items(user = current_user)
    return [] unless user

    saved_items = user.user_items.select(:item_id)
    Item.alphabetical.where.not(id: saved_items).map { |i| [ i.name, i.id ] }
  end
end
