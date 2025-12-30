require "test_helper"

class ItemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    login_as(:admin)
    @item = FactoryBot.create(:item, name: "Existing Item", store: "Store A", price: 29.99)
    @ui1 = FactoryBot.create(:user_item, item: @item, user: @user, purchased: true, rating: 4)
    @user2 = FactoryBot.create(:user)
    @ui2 = FactoryBot.create(:user_item, item: @item, user: @user2, purchased: true, rating: 2)
  end

  test "should get index" do
    get items_path
    assert_response :success
    assert_not_nil assigns(:items)
  end

  test "should get new" do
    get new_item_path
    assert_response :success
  end

  test "should create item" do
    assert_difference("Item.count") do
      post items_path, params: { item: { name: "New Item", store: "Store B", image: "pfp", item_link: "www.testlink.com", price: 39.99, category: "accessory", active: true } }
    end
    assert_equal "Item was successfully created in the system.", flash[:notice]
    assert_redirected_to item_path(assigns(:item))
  end

  test "should not create invalid item" do
    post items_path, params: { item: { name: "Pearlescent Crown", store: "Store B", image: "pfp", item_link: "not a link!!", price: -10, category: "accessory", active: true } }
    assert_template :new
  end

  test "should show item" do
    get item_path(@item)
    assert_response :success
    assert_not_nil assigns(@is_saved)
  end

  test "should get edit" do
    get edit_item_path(@item)
    assert_response :success
  end

  test "should update item" do
    patch item_path(@item), params: { item: { name: "Updated Item", store: "Store A", image: @item.image, item_link: @item.item_link, price: 34.99, category: @item.category, active: false } }
    assert_redirected_to item_path(@item)

    patch item_path(@item), params: { item: { name: "Marinated Headphones", store: "Store A", image: @item.image, item_link: "not a link >:)", price: 34.99, category: @item.category, active: @item.active } }
    assert_template :edit
  end

  test "should destroy item (make inactive)" do
    assert_difference("Item.active.count", -1) do
      delete item_path(@item)
    end

    assert_redirected_to items_path
    follow_redirect!
    @item.reload
    deny @item.active
    assert_equal "#{@item.name} was successfully made inactive in the system.", flash[:notice]
  end
end
