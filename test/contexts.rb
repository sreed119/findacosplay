require "./test/sets/users"
require "./test/sets/media"

module Contexts
  include Contexts::Users
  include Contexts::Media

  def create_all
    create_users
    create_media
  end

  def destroy_all
    Medium.all.each { |x| x.delete }
    User.all.each { |x| x.delete }
  end
end
