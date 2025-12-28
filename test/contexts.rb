require "./test/sets/users"
require "./test/sets/media"
require "./test/sets/characters"
require "./test/sets/items"

module Contexts
  include Contexts::Users
  include Contexts::Media
  include Contexts::Characters
  include Contexts::Items

  def create_all
    create_users
    create_media
    create_characters
    create_items
  end

  def destroy_all
    Item.all.each { |x| x.delete }
    Character.all.each { |x| x.delete }
    Medium.all.each { |x| x.delete }
    User.all.each { |x| x.delete }
  end
end
