module UserItemsHelper
  # helper to pull the list of media for the character form dropdown
  def get_item_options
    Item.alphabetical.map { |i| [ i.name, i.id ] }
  end
end
