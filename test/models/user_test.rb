require "test_helper"

class UserTest < ActiveSupport::TestCase
  # Test Relationships
  should have_many(:user_characters)
  should have_many(:characters).through(:user_characters)

  should have_many(:user_items)
  should have_many(:items).through(:user_items)

  should have_many(:user_media)
  should have_many(:media).through(:user_media)

  # Test Validations
  should allow_value(1).for(:role)
  should allow_value(2).for(:role)

  should allow_value("admin").for(:role)
  should allow_value("user").for(:role)
  # test "the truth" do
  #   assert true
  # end
end
