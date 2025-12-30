require "test_helper"

class UserItemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    login_as(:admin)
    @item1 = FactoryBot.create(:item)
    @item2 = FactoryBot.create(:item)
    @user_item = FactoryBot.create(:user_item, user: @user, item: @item1)
  end

  test "should get index" do
    get user_items_path
    assert_response :success
  end

  test "should get new" do
    get new_user_item_path
    assert_response :success
  end

  test "should create user_item" do
    assert_difference("UserItem.count") do
      post user_items_path, params: { user_item: { item_id: @item2.id, purchased: false, rating: nil, review: nil } }
    end

    assert_redirected_to user_items_path
  end

  test "should not create invalid user_item" do
    assert_no_difference("UserItem.count") do
      post user_items_path, params: { user_item: { item_id: @item1.id, purchased: false, rating: nil, review: nil } }
    end

    assert_response :success
  end

  test "should get edit" do
    get edit_user_item_path(@user_item)
    assert_response :success
  end

  test "should update user_item" do
    patch user_item_path(@user_item), params: { user_item: { item_id: @item1.id, purchased: true, rating: "five_stars", review: "Great item!" } }
    assert_redirected_to user_items_path

    patch user_item_path(@user_item), params: { user_item: { item_id: nil, purchased: nil, rating: "four_stars", review: "Good item." } }
    assert_template :edit
  end

  test "should destroy user_item" do
    assert_difference("UserItem.count", -1) do
      delete user_item_path(@user_item)
    end

    assert_redirected_to user_items_path
  end
end
