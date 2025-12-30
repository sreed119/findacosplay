require "test_helper"

class UserCharactersHelperTest < ActionView::TestCase
  setup do
    @user = FactoryBot.create(:user)
    @media = FactoryBot.create(:medium, name: "My Hero Academia")
    @char1 = FactoryBot.create(:character, name: "Deku", medium: @media)
    @char2 = FactoryBot.create(:character, name: "Bakugo", medium: @media)
    @uc = FactoryBot.create(:user_character, user: @user, character: @char1)
  end

  test "should get correct characters options array for dropdown menu" do
    assert_equal [ [ "#{@char2.name} (#{@media.name})", @char2.id ] ], get_character_options(@user)
  end
end
