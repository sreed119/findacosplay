module Contexts
  module UserCharacters
    def create_user_characters
      @steph_c1 = FactoryBot.create(:user_character, user: @u_steph, character: @c_nami)
      @steph_c2 = FactoryBot.create(:user_character, user: @u_steph, character: @c_luffy)
      @steph_c3 = FactoryBot.create(:user_character, user: @u_steph, character: @c_sasuke)
      @larry_c1 = FactoryBot.create(:user_character, user: @u_larry, character: @c_luffy)
    end
  end
end
