require "test_helper"

class CharactersControllerTest < ActionDispatch::IntegrationTest
  setup do
    login_as(:admin)
    @medium = FactoryBot.create(:medium, name: "Test Medium", media_type: "game")
    @character = FactoryBot.create(:character, name: "Test Character", medium: @medium)
  end

  test "should get index" do
    get characters_path
    assert_response :success
    assert_not_nil assigns(:characters)
  end

  test "should get new" do
    get new_character_path
    assert_response :success
  end

  test "should create character" do
    assert_difference("Character.count") do
      post characters_path, params: { character: { name: "New Character", medium_id: @medium.id, image: "pfp", hair_color: "Black", hair_length: "long", eye_color: "Brown" } }
    end
    assert_equal "Character was successfully created in the system.", flash[:notice]
    assert_redirected_to character_path(assigns(:character))
  end

  test "should not create invalid character" do
    post characters_path, params: { character: { name: nil, medium_id: @medium.id, image: "pfp", hair_color: "Black", hair_length: "long", eye_color: "Brown" } }
    assert_template :new
  end

  test "should show character" do
    get character_path(@character)
    assert_response :success
  end

  test "should get edit" do
    get edit_character_path(@character)
    assert_response :success
  end

  test "should update character" do
    patch character_path(@character), params: { character: { name: "Updated Character", medium_id: @medium.id, image: "newpfp", hair_color: "Blonde", hair_length: "short", eye_color: "Blue" } }
    assert_redirected_to character_path(@character)

    patch character_path(@character), params: { character: { name: nil, medium_id: @medium.id, image: "newpfp", hair_color: "Blonde", hair_length: "short", eye_color: "Blue" } }
    assert_template :edit
  end
end
