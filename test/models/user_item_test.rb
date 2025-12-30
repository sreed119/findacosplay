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

  context "Within context" do
    setup do
      create_users
      create_items
      create_user_items
    end

    should "not allow duplicate user_item associations" do
      ui_dup = FactoryBot.build(:user_item, user: @u_steph, item: @strawhat)
      deny ui_dup.valid?
    end
  end
  # test "the truth" do
  #   assert true
  # end
end
