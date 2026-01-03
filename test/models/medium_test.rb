require "test_helper"

class MediumTest < ActiveSupport::TestCase
  # Test Relationships
  should have_many(:characters)
  should have_many(:user_media)
  should have_many(:users).through(:user_media)

  # Test Validations
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

  should validate_presence_of(:name)
  should validate_presence_of(:media_type)

  context "Within context" do
    setup do
      create_media
    end

    should "not allow duplicate media" do
      m_dup = FactoryBot.build(:medium, name: "Naruto", media_type: "animanga")
      deny m_dup.valid?
    end

    should "strip leading and trailing whitespace from name" do
      m_strip = FactoryBot.create(:medium, name: "  Bleach  ", media_type: "animanga")
      assert_equal "Bleach", m_strip.name
    end

    should "correctly assess that a medium is not destroyable" do
      deny @onepiece.destroy
    end

    should "show that scope exists for alphabeticizing media" do
      assert_equal [ "Gravity Falls", "Naruto", "One Piece", "Splatoon" ], Medium.alphabetical.map(&:name)
    end

    should "show that scope exists for filtering media by media type" do
      assert_equal [ "Naruto", "One Piece" ], Medium.by_media_type("animanga").map(&:name)
      assert_equal [ "Splatoon" ], Medium.by_media_type("game").map(&:name)
    end

    should "show that scope exists for searching media by term" do
      assert_equal [ "Naruto", "One Piece", "Splatoon" ], Medium.search("N").map(&:name)
      assert_equal [ "One Piece", "Splatoon" ], Medium.search("On").map(&:name)
      assert_equal [ "Splatoon" ], Medium.search("Splat").map(&:name)
    end
  end
  # test "the truth" do
  #   assert true
  # end
end
