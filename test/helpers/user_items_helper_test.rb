require "test_helper"

class UserItemsHelperTest < ActionView::TestCase
  setup do
    @user = FactoryBot.create(:user)
    @item1 = FactoryBot.create(:item, name: "Sword")
    @item2 = FactoryBot.create(:item, name: "Shield")
    @ui = FactoryBot.create(:user_item, user: @user, item: @item1)
  end

  test "should get correct items options array for dropdown menu" do
    assert_equal [ [ "#{@item2.name}", @item2.id ] ], get_item_options(@user)
  end
end
