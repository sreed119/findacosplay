require "./test/sets/users"
require "./test/sets/media"
require "./test/sets/characters"

module Contexts
  include Contexts::Users
  include Contexts::Media
  include Contexts::Characters

  def create_all
    create_users
    create_media
    create_characters
  end

  def destroy_all
    Character.all.each { |x| x.delete }
    Medium.all.each { |x| x.delete }
    User.all.each { |x| x.delete }
  end
end
