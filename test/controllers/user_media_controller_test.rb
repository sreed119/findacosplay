require "test_helper"

class UserMediaControllerTest < ActionDispatch::IntegrationTest
  setup do
    login_as(:admin)
    @medium = FactoryBot.create(:medium, name: "Test Medium", media_type: "game")
    @medium2 = FactoryBot.create(:medium, name: "Second Medium", media_type: "animanga")
    @user_medium = FactoryBot.create(:user_medium, user_id: @user.id, medium_id: @medium.id)
  end

  test "should get index" do
    get user_media_path
    assert_response :success
    assert_not_nil assigns(:user_media)
  end

  test "should get new" do
    get new_user_medium_path
    assert_response :success
  end

  test "should create user_medium from the current medium page" do
    assert_difference("UserMedium.count") do
      post user_media_path, params: { user_medium: { medium_id: @medium2.id } }
    end
    assert_equal "Media was successfully added to your saves.", flash[:notice]
    assert_redirected_to medium_path(@medium2)
  end

  test "should not create invalid user_medium and redirect back" do
    post user_media_path, params: { user_medium: { medium_id: @medium.id } }
    assert_equal "You've already saved Test Medium!", flash[:alert]
    assert_redirected_to medium_path(@medium)
  end

  test "should destroy user_medium" do
    assert_difference("UserMedium.count", -1) do
      delete user_medium_path(@user_medium)
    end
    assert_equal "Saved media was successfully removed.", flash[:notice]
    assert_redirected_to user_media_path
  end
end
