require "test_helper"

class UserItemTest < ActiveSupport::TestCase
  # Test Relationships
  should belong_to(:user)
  should belong_to(:item)

  # Test Validations
  should validate_presence_of(:user_id)
  should validate_presence_of(:item_id)

  should allow_value(nil).for(:rating)
  should allow_value("one_star").for(:rating)
  should allow_value("two_stars").for(:rating)
  should allow_value("three_stars").for(:rating)
  should allow_value("four_stars").for(:rating)
  should allow_value("five_stars").for(:rating)
  # test "the truth" do
  #   assert true
  # end
end
