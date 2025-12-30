require "test_helper"

class UserCharactersControllerTest < ActionDispatch::IntegrationTest
  setup do
    login_as(:admin)
    @media = FactoryBot.create(:medium)
    @character = FactoryBot.create(:character, medium: @media)
    @character2 = FactoryBot.create(:character, medium: @media)
    @user_character = FactoryBot.create(:user_character, user: @user, character: @character)
  end

  test "should get index" do
    get user_characters_path
    assert_response :success
    assert_not_nil assigns(:user_characters)
  end

  test "should get new" do
    get new_user_character_path
    assert_response :success
  end

  test "should create user_character" do
    assert_difference("UserCharacter.count") do
      post user_characters_path, params: { user_character: { character_id: @character2.id, user: @user } }
    end
    assert_equal "Character was successfully added to your saves.", flash[:notice]
    assert_redirected_to user_characters_path
  end

  test "should not create invalid user_character" do
    post user_characters_path, params: { user_character: { character_id: @character.id, user: @user } }
    assert_template :new
  end

  test "should destroy user_character" do
    @character3 = FactoryBot.create(:character, medium: @media)
    @byebye_character = FactoryBot.create(:user_character, user_id: @user.id, character_id: @character3.id)
    assert_difference("UserCharacter.count", -1) do
      delete user_character_path(@byebye_character)
    end
    assert_equal "Saved character was successfully removed.", flash[:notice]
    assert_redirected_to user_characters_path
  end
end
