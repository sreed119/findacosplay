require "./test/sets/users"
require "./test/sets/media"
require "./test/sets/characters"
require "./test/sets/items"
require "./test/sets/user_media"
require "./test/sets/user_characters"
require "./test/sets/user_items"
require "./test/sets/character_items"
require "./test/sets/abilities"

module Contexts
  include Contexts::Users
  include Contexts::Media
  include Contexts::Characters
  include Contexts::Items
  include Contexts::UserMedia
  include Contexts::UserCharacters
  include Contexts::UserItems
  include Contexts::CharacterItems
  include Contexts::Abilities

  def create_all
    create_users
    create_media
    create_characters
    create_items
    create_user_media
    create_user_characters
    create_user_items
    create_character_items
  end

  def destroy_all
    CharacterItem.all.each { |x| x.delete }
    UserItem.all.each { |x| x.delete }
    UserCharacter.all.each { |x| x.delete }
    UserMedium.all.each { |x| x.delete }
    Item.all.each { |x| x.delete }
    Character.all.each { |x| x.delete }
    Medium.all.each { |x| x.delete }
    User.all.each { |x| x.delete }
  end
end
