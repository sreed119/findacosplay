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

  should validate_presence_of(:name)
  should validate_presence_of(:category)
  should validate_presence_of(:item_link)
  should validate_presence_of(:store)
  should validate_numericality_of(:price).is_greater_than_or_equal_to(0)
  # test "the truth" do
  #   assert true
  # end
end
