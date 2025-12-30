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

  should allow_value("admin@example.com").for(:email)
  should allow_value("sreed2@andrew.cmu.edu").for(:email)
  should allow_value("stephanie.reed.3026@gmail.com").for(:email)

  should_not allow_value("!!!!@. ?,com").for(:email)
  should_not allow_value("my fred@fred.com").for(:email)
  should_not allow_value("fred@fred.con").for(:email)

  should allow_value("stephie").for(:username)
  should allow_value("catatonic_123").for(:username)
  should allow_value("prof_h").for(:username)
  should allow_value("C-M-U").for(:username)

  should_not allow_value("stephie!").for(:username)
  should_not allow_value("cat atonic").for(:username)
  should_not allow_value("prof#h").for(:username)

  context "Within context" do
    setup do
      create_users
    end

    should "require users to have unique, case-insensitive usernames" do
      assert_equal "stephie", @u_steph.username
      # try to switch to Alex's username 'tank', but capitalized
      @u_steph.username = "LARRY"
      deny @u_steph.valid?, "#{@u_steph.username}"
    end

    should "require a password for new users" do
      bad_user = FactoryBot.build(:user, username: "wheezy", password: nil)
      deny bad_user.valid?
    end

    should "require passwords to be confirmed and matching" do
      bad_user_1 = FactoryBot.build(:user, username: "wheezy", password: "secret", password_confirmation: nil)
      deny bad_user_1.valid?
      bad_user_2 = FactoryBot.build(:user, username: "wheezy", password: "secret", password_confirmation: "sauce")
      deny bad_user_2.valid?
    end

    should "require passwords to be at least six characters" do
      bad_user = FactoryBot.build(:user, username: "wheezy", password: "no", password_confirmation: "no")
      deny bad_user.valid?
    end

    should "have class method to handle authentication services" do
      assert User.authenticate("stephie", "secret")
      deny User.authenticate("stephie", "notsecret")
    end

    should "have instance method to handle authentication services" do
      assert_equal @u_steph, @u_steph.authenticate("secret")
      deny @u_steph.authenticate("notsecret")
    end

    should "have role methods and recognize all three roles" do
      assert @u_steph.admin_role? # should be a customer
      deny @u_steph.user_role?

      assert @u_larry.user_role? # should be a regular user
      deny @u_larry.admin_role?
    end

    should "show that scope exists for alphabeticizing users" do
      assert_equal [ "catatonic", "larry", "stephie", "vi" ], User.alphabetical.all.map(&:username)
    end

    should "show that there are two admin" do
      assert_equal 2, User.admins.size
      assert_equal [ "catatonic", "stephie" ], User.admins.all.map(&:username).sort
    end

    should "show that there are two regular users" do
      assert_equal 2, User.users.size
      assert_equal [ "larry", "vi" ], User.users.all.map(&:username).sort
    end

    should "remove associated user_characters, user_items, and user_media on destroy" do
      @test_user = FactoryBot.create(:user)
      test_user_id = @test_user.id
      @test_character = FactoryBot.create(:character)
      @test_item = FactoryBot.create(:item)
      @test_media = FactoryBot.create(:medium)
      @uc = FactoryBot.create(:user_character, user: @test_user, character: @test_character)
      @ui = FactoryBot.create(:user_item, user: @test_user, item: @test_item)
      @um = FactoryBot.create(:user_medium, user: @test_user, medium: @test_media)
      @test_user.destroy
      @test_user.destroyed?
      assert_nil UserCharacter.find_by(id: test_user_id)
      assert_nil UserItem.find_by(id: test_user_id)
      assert_nil UserMedium.find_by(id: test_user_id)
    end
  end
  # test "the truth" do
  #   assert true
  # end
end
