require "test_helper"

class ItemTest < ActiveSupport::TestCase
  # Test Relationships
  should have_many(:user_items)
  should have_many(:users).through(:user_items)

  should have_many(:character_items)
  should have_many(:characters).through(:character_items)

  # Test Validations
  should allow_value(1).for(:category)
  should allow_value(2).for(:category)
  should allow_value(3).for(:category)
  should allow_value(4).for(:category)
  should allow_value(5).for(:category)
  should allow_value(6).for(:category)
  should allow_value(7).for(:category)

  should allow_value("prop").for(:category)
  should allow_value("clothing").for(:category)
  should allow_value("wig").for(:category)
  should allow_value("accessory").for(:category)
  should allow_value("makeup").for(:category)
  should allow_value("contacts").for(:category)
  should allow_value("hat").for(:category)

  should allow_value("http://example.com/item").for(:item_link)
  should allow_value("www.example.com").for(:item_link)
  should allow_value("https://www.miccostumes.com/jojos-golden-wind-trish-cosplay-costume-106507p.html").for(:item_link) # this is a real link so if it doesn't work we're cooked

  should_not allow_value("example").for(:item_link)
  should_not allow_value("htp:/example.com").for(:item_link)
  should_not allow_value("aknvke!?CEMK").for(:item_link)

  should validate_presence_of(:name)
  should validate_presence_of(:category)
  should validate_presence_of(:item_link)
  should validate_presence_of(:store)
  should validate_numericality_of(:price).is_greater_than_or_equal_to(0)
  # test "the truth" do
  #   assert true
  # end
end
