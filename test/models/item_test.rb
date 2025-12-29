require "test_helper"

class ItemTest < ActiveSupport::TestCase
  # Test Relationships
  should have_many(:user_items)
  should have_many(:users).through(:user_items)

  should have_many(:character_items)
  should have_many(:characters).through(:character_items)

  # Test Validations
  should allow_value(1).for(:category)
  should allow_value(2).for(:category)
  should allow_value(3).for(:category)
  should allow_value(4).for(:category)
  should allow_value(5).for(:category)
  should allow_value(6).for(:category)
  should allow_value(7).for(:category)

  should allow_value("prop").for(:category)
  should allow_value("clothing").for(:category)
  should allow_value("wig").for(:category)
  should allow_value("accessory").for(:category)
  should allow_value("makeup").for(:category)
  should allow_value("contacts").for(:category)
  should allow_value("hat").for(:category)

  should allow_value("http://example.com/item").for(:item_link)
  should allow_value("www.example.com").for(:item_link)
  should allow_value("https://www.miccostumes.com/jojos-golden-wind-trish-cosplay-costume-106507p.html").for(:item_link) # this is a real link so if it doesn't work we're cooked

  should_not allow_value("example").for(:item_link)
  should_not allow_value("htp:/example.com").for(:item_link)
  should_not allow_value("aknvke!?CEMK").for(:item_link)

  should validate_presence_of(:name)
  should validate_presence_of(:category)
  should validate_presence_of(:item_link)
  should validate_presence_of(:store)
  should validate_numericality_of(:price).is_greater_than_or_equal_to(0)

  context "Within context" do
    setup do
      create_items
    end

    should "require items to have unique, case-sensitive links" do
      # Try to switch strawhat's link to ninja_headband's link
      @strawhat.item_link = @ninja_headband.item_link
      deny @strawhat.valid?, "#{@strawhat.item_link}"
    end

    should "show that scope exists for alphabeticizing items" do
      assert_equal [ "Ninja Headband", "Splattershot", "Straw Hat" ], Item.alphabetical.map(&:name)
    end

    should "show that scope exists for searching items by term" do
      assert_equal [ "Splattershot", "Straw Hat" ], Item.search("at").map(&:name)
      assert_equal [ "Straw Hat" ], Item.search("Straw").map(&:name)
    end

    should "show that there are two active items do" do
      assert_equal [ "Ninja Headband", "Straw Hat" ], Item.active.all.map(&:name).sort
    end

    should "show that there is one inactive item" do
      assert_equal [ "Splattershot" ], Item.inactive.all.map(&:name).sort
    end

    should "have make_active and make_inactive methods" do
      assert @ninja_headband.active
      @ninja_headband.make_inactive
      @ninja_headband.reload
      deny @ninja_headband.active
      @ninja_headband.make_active
      @ninja_headband.reload
      assert @ninja_headband.active
    end
  end
  # test "the truth" do
  #   assert true
  # end
end
