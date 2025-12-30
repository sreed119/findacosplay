require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    login_as(:admin)
  end

  test "should get index" do
    get users_path
    assert_response :success
    assert_not_nil assigns(:users)
    assert_not_nil assigns(:admins)
    assert_not_nil assigns(:regular_users)
  end

  test "should get new" do
    get new_user_path
    assert_response :success
  end

  test "should create user" do
    assert_difference("User.count") do
      post users_path, params: { user: { username: "newuser", email: "newuser@example.com", password: "secret", password_confirmation: "secret" } }
    end
    assert_equal "New account created successfully. Welcome to Find a Cosplay!", flash[:notice]
    assert_redirected_to user_path(assigns(:user))
  end

  test "should not create invalid user" do
    post users_path, params: { user: { username: "bad!!?! user", email: "newuser@example.com", password: "hi", password_confirmation: "hi" } }
    assert_template :new
  end

  test "should show user" do
    get user_path(@user)
    assert_response :success
  end

  test "should get edit" do
    get edit_user_path(@user)
    assert_response :success
  end

  test "should update user" do
    patch user_path(@user), params: { user: { username: @user.username, email: "updated@example.com", password: "secret", password_confirmation: "secret", role: @user.role, profile_picture: @user.profile_picture } }
    assert_redirected_to user_path(@user)

    patch user_path(@user), params: { user: { username: @user.username, email: "bad!! $%@example.com", password: "secret", password_confirmation: "secret", role: @user.role, profile_picture: @user.profile_picture } }
    assert_template :edit
  end

  test "non-admin should not update role" do
    logout_now
    login_as(:user)
    patch user_path(@user), params: { user: { username: @user.username, email: "updated@example.com", password: "secret", password_confirmation: "secret", profile_picture: @user.profile_picture } }
    assert_redirected_to user_path(@user)
    logout_now
    login_as(:admin)
  end

  test "should destroy user" do
    @byebyeuser = FactoryBot.create(:user, username: "byebyeuser", email: "bye@example.com")
    assert_difference("User.count", -1) do
      delete user_path(@byebyeuser)
    end
    assert_equal "User account deleted successfully.", flash[:notice]
    assert_redirected_to home_path
  end
end
