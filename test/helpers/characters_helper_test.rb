require "test_helper"

class CharactersHelperTest < ActionView::TestCase
  setup do
    @media = FactoryBot.create(:medium, name: "The Legend of Zelda")
  end

  test "should get correct media options array for dropdown menu" do
    assert_equal [ [ "#{@media.name}", @media.id ] ], get_media_options
  end
end
