require "test_helper"

class MediaControllerTest < ActionDispatch::IntegrationTest
  setup do
    login_as(:admin)
    @medium = FactoryBot.create(:medium, name: "Existing Medium", media_type: "game")
    @medium2 = FactoryBot.create(:medium, name: "Another Medium", media_type: "game")
  end

  test "should get index" do
    get media_path, params: { query: "Existing", media_type: "game" }
    assert_response :success
    assert_not_nil assigns(:media)
  end

  test "should get new" do
    get new_medium_path
    assert_response :success
  end

  test "should create medium" do
    assert_difference("Medium.count") do
      post media_path, params: { medium: { name: "New Medium", media_type: "game" } }
    end
    assert_equal "Media was successfully created in the system.", flash[:notice]
    assert_redirected_to medium_path(assigns(:medium))
  end

  test "should not create invalid medium" do
    post media_path, params: { medium: { name: "Existing Medium", media_type: "game" } }
    assert_template :new
  end

  test "should show medium" do
    get medium_path(@medium)
    assert_response :success
    assert_not_nil assigns(@is_saved)
  end

  test "should get edit" do
    get edit_medium_path(@medium)
    assert_response :success
  end

  test "should update medium" do
    patch medium_path(@medium), params: { medium: { name: "Updated Medium", media_type: "game" } }
    assert_redirected_to medium_path(@medium)

    patch medium_path(@medium), params: { medium: { name: nil, media_type: "game" } }
    assert_template :edit
  end
end
