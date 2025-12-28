module Contexts
  module Users
    def create_users
      @u_steph = FactoryBot.create(:admin, username: "stephie", email: "stephie@example.com")
      @u_larry = FactoryBot.create(:user, username: "larry", email: "larry@andrew.cmu.edu")
    end
  end
end
