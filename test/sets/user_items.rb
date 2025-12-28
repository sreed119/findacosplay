module Contexts
  module UserItems
    def create_user_items
      @steph_strawhat = FactoryBot.create(:user_item, user: @u_steph, item: @strawhat)
      @larry_ninja_headband = FactoryBot.create(:user_item, user: @u_larry, item: @ninja_headband)
    end
  end
end
