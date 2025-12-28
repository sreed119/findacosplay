require "test_helper"

class UserCharacterTest < ActiveSupport::TestCase
  # Test Relationships
  should belong_to(:user)
  should belong_to(:character)

  # Test Validations
  should validate_presence_of(:user_id)
  should validate_presence_of(:character_id)
  # test "the truth" do
  #   assert true
  # end
end
