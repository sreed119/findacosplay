require "test_helper"

class CharacterTest < ActiveSupport::TestCase
  # Test Relationships
  should belong_to(:medium)

  should have_many(:user_characters)
  should have_many(:users).through(:user_characters)

  should have_many(:character_items)
  should have_many(:items).through(:character_items)

  # Test Validations
  should allow_value(1).for(:hair_length)
  should allow_value(2).for(:hair_length)
  should allow_value(3).for(:hair_length)
  should allow_value(4).for(:hair_length)

  should allow_value("short").for(:hair_length)
  should allow_value("bob").for(:hair_length)
  should allow_value("medium").for(:hair_length)
  should allow_value("long").for(:hair_length)

  should validate_presence_of(:name)
  should validate_presence_of(:medium_id)

  context "Within context" do
    setup do
      create_media
      create_characters
    end

    should "have a method to describe hair type" do
      assert_equal "short, Yellow hair", @c_naruto.hair_type
      assert_equal "short, Black hair", @c_luffy.hair_type
      assert_equal "Orange bob", @c_nami.hair_type
    end
  end
  # test "the truth" do
  #   assert true
  # end
end
