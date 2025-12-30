require "test_helper"

class AbilitiesApplicationControllerTest < ActionDispatch::IntegrationTest
  # A few tests to make sure abilities were properly applied at the controller
  # level and the exception is properly handled
  setup do
    create_users
    create_media
    create_characters
    create_items
    create_user_media
    create_user_characters
    create_user_items
    get logout_path
  end

  test "no user can access another user's saves" do
    login_user(@u_steph)
    delete user_character_path(@larry_c1)
    assert_equal "You are not authorized to take this action.", flash[:error]

    delete user_medium_path(@larry_naruto)
    assert_equal "You are not authorized to take this action.", flash[:error]

    get edit_user_item_path(@larry_ninja_headband)
    assert_equal "You are not authorized to take this action.", flash[:error]
  end
  test "an admin can see all users" do
    login_user(@u_steph)
    get users_path
    assert_response :success
    get user_path(@u_larry)
    assert_response :success
  end

  test "a user cannot see other user's accounts" do
    login_user(@u_larry)
    get user_path(@u_larry)
    assert_response :success
    get user_path(@u_steph)
    assert_equal "You are not authorized to take this action.", flash[:error]
    assert_redirected_to home_path
  end
end
