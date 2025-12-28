require "test_helper"

class UserItemTest < ActiveSupport::TestCase
  # Test Relationships
  should belong_to(:user)
  should belong_to(:item)

  # Test Validations
  should validate_presence_of(:user_id)
  should validate_presence_of(:item_id)
  # test "the truth" do
  #   assert true
  # end
end
