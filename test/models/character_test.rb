require "test_helper"

class CharacterTest < ActiveSupport::TestCase
  should belong_to(:medium)

  should have_many(:user_characters)
  should have_many(:users).through(:user_characters)

  should have_many(:character_items)
  should have_many(:items).through(:character_items)

  should allow_value(1).for(:hair_length)
  should allow_value(2).for(:hair_length)
  should allow_value(3).for(:hair_length)
  should allow_value(4).for(:hair_length)

  should allow_value("short").for(:hair_length)
  should allow_value("bob").for(:hair_length)
  should allow_value("medium").for(:hair_length)
  should allow_value("long").for(:hair_length)
  # test "the truth" do
  #   assert true
  # end
end
