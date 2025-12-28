require "./test/sets/users"

module Contexts
  include Contexts::Users

  def create_all
    create_users
  end

  def destroy_all
    User.all.each { |x| x.delete }
  end
end
