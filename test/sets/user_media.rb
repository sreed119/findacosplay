module Contexts
  module UserMedia
    def create_user_media
      @steph_splatoon = FactoryBot.create(:user_medium, user: @u_steph, medium: @splatoon)
      @steph_onepiece = FactoryBot.create(:user_medium, user: @u_steph, medium: @onepiece)
      @larry_naruto = FactoryBot.create(:user_medium, user: @u_larry, medium: @naruto)
      @larry_onepiece = FactoryBot.create(:user_medium, user: @u_larry, medium: @onepiece)
    end

    def destroy_user_media
      @steph_splatoon.delete
      @steph_onepiece.delete
      @larry_naruto.delete
      @larry_onepiece.delete
    end
  end
end
