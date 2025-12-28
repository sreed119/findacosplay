module Contexts
  module Users
    def create_users
      @u_steph = FactoryBot.create(:user, username: "stephie", email: "stephie@example.com", role: "admin")
      @u_larry = FactoryBot.create(:user, username: "larry", email: "larry@andrew.cmu.edu")
    end
  end
end
