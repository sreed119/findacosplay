require "test_helper"

class UserMediumTest < ActiveSupport::TestCase
  # Test Relationships
  should belong_to(:user)
  should belong_to(:medium)

  # Test Validations
  should validate_presence_of(:user_id)
  should validate_presence_of(:medium_id)
  # test "the truth" do
  #   assert true
  # end
end
