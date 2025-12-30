require "test_helper"

class UserCharacterTest < ActiveSupport::TestCase
  # Test Relationships
  should belong_to(:user)
  should belong_to(:character)

  # Test Validations
  should validate_presence_of(:user_id)
  should validate_presence_of(:character_id)

  context "Within context" do
    setup do
      create_users
      create_media
      create_characters
      create_user_characters
    end

    should "not allow duplicate user_character associations" do
      uc_dup = FactoryBot.build(:user_character, user: @u_steph, character: @c_nami)
      deny uc_dup.valid?
    end
  end
  # test "the truth" do
  #   assert true
  # end
end
