module CharacterItemsHelper
  def get_character_item_options(item_id = nil)
    if item_id
      # characters that aren't already associated with this item
      associated_character_ids = CharacterItem.where(item_id: item_id).select(:character_id)
      Character.alphabetical.where.not(id: associated_character_ids).map { |c| [ "#{c.name} (#{c.medium.name})", c.id ] }
    else
      Character.alphabetical.map { |c| [ "#{c.name} (#{c.medium.name})", c.id ] }
    end
  end

  def get_item_options
    Item.alphabetical.active.map { |i| [ i.name, i.id ] }
  end
end
