require "test_helper"

class CharacterItemTest < ActiveSupport::TestCase
  # Test Relationships
  should belong_to(:character)
  should belong_to(:item)

  # Test Validations
  should validate_presence_of(:character_id)
  should validate_presence_of(:item_id)
  # test "the truth" do
  #   assert true
  # end
end
