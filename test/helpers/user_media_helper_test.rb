require "test_helper"

class UserMediaHelperTest < ActionView::TestCase
  setup do
    @user = FactoryBot.create(:user)
    @media = FactoryBot.create(:medium, name: "My Hero Academia")
    @media2 = FactoryBot.create(:medium, name: "Attack on Titan")
    @um = FactoryBot.create(:user_medium, user: @user, medium: @media)
  end

  test "should get correct media options array for dropdown menu" do
    assert_equal [ [ "#{@media2.name}", @media2.id ] ], get_medium_options(@user)
  end
end
