require "test_helper"

class CharacterItemsHelperTest < ActionView::TestCase
  setup do
    @media = FactoryBot.create(:medium, name: "Sailor Moon")
    @char = FactoryBot.create(:character, name: "Sailor Venus", medium: @media)
    @item = FactoryBot.create(:item, name: "Moon Stick")
  end

  test "should get correct character options array for dropdown menu" do
    assert_equal [ [ "#{@char.name} (#{@media.name})", @char.id ] ], get_character_item_options
  end

  test "should get correct items options array for dropdown menu" do
    assert_equal [ [ "#{@item.name}", @item.id ] ], get_item_options
  end
end
