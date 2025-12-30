require "test_helper"

class CharacterItemTest < ActiveSupport::TestCase
  # Test Relationships
  should belong_to(:character)
  should belong_to(:item)

  # Test Validations
  should validate_presence_of(:character_id)
  should validate_presence_of(:item_id)

  context "Within context" do
    setup do
      create_media
      create_characters
      create_items
      create_character_items
    end

    should "not allow duplicate character_item associations" do
      ci_dup = FactoryBot.build(:character_item, character: @c_naruto, item: @ninja_headband)
      deny ci_dup.valid?
    end
  end
  # test "the truth" do
  #   assert true
  # end
end
