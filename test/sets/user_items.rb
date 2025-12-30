module Contexts
  module UserItems
    def create_user_items
      @steph_strawhat = FactoryBot.create(:user_item, user: @u_steph, item: @strawhat, purchased: true, rating: "five_stars", review: "Great quality!")
      @larry_ninja_headband = FactoryBot.create(:user_item, user: @u_larry, item: @ninja_headband)
    end

    def destroy_user_items
      @steph_strawhat.delete
      @larry_ninja_headband.delete
    end
  end
end
