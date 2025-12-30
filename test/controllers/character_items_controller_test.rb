require "test_helper"

class CharacterItemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    login_as(:admin)
    @medium = FactoryBot.create(:medium)
    @character = FactoryBot.create(:character, medium: @medium)
    @character2 = FactoryBot.create(:character, medium: @medium)
    @item = FactoryBot.create(:item)
    @character_item = FactoryBot.create(:character_item, character: @character, item: @item)
  end

  test "should get new" do
    get new_character_item_path
    assert_response :success
  end

  test "should create character_item" do
    assert_difference("CharacterItem.count") do
      post character_items_path, params: { character_item: { character_id: @character2.id, item_id: @item.id } }
    end

    assert_redirected_to character_path(@character2)
    follow_redirect!
    assert_equal "Item was successfully added to the character #{@character2.name}.", flash[:notice]
  end

  test "should destroy character_item" do
    @character3 = FactoryBot.create(:character, medium: @medium)
    @byebye_saved_item = FactoryBot.create(:character_item, character: @character3, item: @item)
    assert_difference("CharacterItem.count", -1) do
      delete character_item_path(@byebye_saved_item)
    end

    assert_redirected_to character_path(@character3)
    follow_redirect!
    assert_equal "Item was successfully removed from the character #{@character3.name}.", flash[:notice]
  end
end
