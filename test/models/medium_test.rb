require "test_helper"

class MediumTest < ActiveSupport::TestCase
  should have_many(:characters)
  should have_many(:user_media)
  should have_many(:users).through(:user_media)

  should allow_value(1).for(:media_type)
  should allow_value(3).for(:media_type)
  should allow_value(4).for(:media_type)
  should allow_value(5).for(:media_type)
  should allow_value(6).for(:media_type)

  should allow_value("animanga").for(:media_type)
  should allow_value("game").for(:media_type)
  should allow_value("cartoon").for(:media_type)
  should allow_value("movie").for(:media_type)
  should allow_value("tv_show").for(:media_type)
  # test "the truth" do
  #   assert true
  # end
end
