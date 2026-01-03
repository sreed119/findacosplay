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

    should "not allow duplicate characters for the same medium" do
      c_dup = FactoryBot.build(:character, name: "Naruto Uzumaki", medium_id: @naruto)
      deny c_dup.valid?

      c_dup2 = FactoryBot.build(:character, name: "Monkey D. Luffy", medium: @onepiece)
      deny c_dup2.valid?
    end

    should "strip leading and trailing whitespace from name" do
      m_strip = FactoryBot.create(:character, name: "  Agent 8  ", medium: @splatoon)
      assert_equal "Agent 8", m_strip.name
    end

    should "correctly assess that a character is not destroyable" do
      deny @c_naruto.destroy
    end

    should "have a method to describe hair type" do
      assert_equal "short, Yellow hair", @c_naruto.hair_type
      assert_equal "short, Black hair", @c_luffy.hair_type
      assert_equal "Orange bob", @c_nami.hair_type
      assert_equal "No hair", @c_whitebeard.hair_type
    end

    should "show that scope exists for alphabeticizing characters" do
      assert_equal [ "Monkey D. Luffy", "Nami", "Naruto Uzumaki", "Sasuke Uchiha", "Whitebeard" ], Character.alphabetical.map(&:name)
    end

    should "show that scope exists for searching characters by term" do
      assert_equal [ "Nami", "Naruto Uzumaki", "Sasuke Uchiha", "Whitebeard" ], Character.search("A").map(&:name)
      assert_equal [ "Nami", "Naruto Uzumaki" ], Character.search("Na").map(&:name)
      assert_equal [ "Monkey D. Luffy" ], Character.search("Luffy").map(&:name)
    end

    should "show that scope exists for filtering characters by medium" do
      assert_equal [ "Naruto Uzumaki", "Sasuke Uchiha" ], Character.for_medium(@naruto.id).map(&:name).sort
      assert_equal [ "Monkey D. Luffy", "Nami", "Whitebeard" ], Character.for_medium(@onepiece.id).map(&:name)
    end

    should "show that scope exists for filtering characters by hair length" do
      assert_equal [ "Monkey D. Luffy", "Naruto Uzumaki" ], Character.with_hair_length("short").map(&:name).sort
      assert_equal [ "Nami", "Sasuke Uchiha" ], Character.with_hair_length("bob").map(&:name).sort
    end

    should "show that scope exists for filtering characters by hair color" do
      assert_equal [ "Naruto Uzumaki" ], Character.with_hair_color("Yellow").map(&:name)
      assert_equal [ "Monkey D. Luffy", "Sasuke Uchiha" ], Character.with_hair_color("Black").map(&:name).sort
      assert_equal [ "Nami" ], Character.with_hair_color("Orange").map(&:name)
    end

    should "show that scope exists for filtering characters by eye color" do
      assert_equal [ "Naruto Uzumaki" ], Character.with_eye_color("Blue").map(&:name)
      assert_equal [ "Sasuke Uchiha" ], Character.with_eye_color("Black").map(&:name)
    end
  end
  # test "the truth" do
  #   assert true
  # end
end
