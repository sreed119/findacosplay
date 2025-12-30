require "test_helper"

class UserMediumTest < ActiveSupport::TestCase
  # Test Relationships
  should belong_to(:user)
  should belong_to(:medium)

  # Test Validations
  should validate_presence_of(:user_id)
  should validate_presence_of(:medium_id)

  context "Within context" do
    setup do
      create_users
      create_media
      create_user_media
    end

    should "not allow duplicate user_medium associations" do
      um_dup = FactoryBot.build(:user_medium, user: @u_steph, medium: @splatoon)
      deny um_dup.valid?
    end
  end
  # test "the truth" do
  #   assert true
  # end
end
