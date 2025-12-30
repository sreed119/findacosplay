module CharacterItemsHelper
  def get_character_item_options
    Character.alphabetical.map { |c| [ "#{c.name} (#{c.medium.name})", c.id ] }
  end

  def get_item_character_options
    Item.alphabetical.active.map { |i| [ i.name, i.id ] }
  end
end
