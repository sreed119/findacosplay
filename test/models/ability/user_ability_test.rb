require "test_helper"

class UserAbilityTest < ActiveSupport::TestCase
  context "Within context" do
    should "be able to manage own profile but not others" do
      create_user_abilities
      deny @jason_ability.can? :manage, :all
      deny @jason_ability.can? :manage, @u_steph
      assert @jason_ability.can? :manage, Item
      assert @jason_ability.can? :manage, Medium
      assert @jason_ability.can? :manage, Character
      assert @jason_ability.can? :manage, CharacterItem
      deny @jason_ability.can? :index, User

      assert @jason_ability.can? :show, @jason
      deny @jason_ability.can? :show, @u_steph
      assert @jason_ability.can? :update, @jason
      deny @jason_ability.can? :update, @u_steph
      assert @jason_ability.can? :destroy, @jason
      deny @jason_ability.can? :destroy, @u_steph

      assert @jason_ability.can? :manage, @jason_onepiece
      assert @jason_ability.can? :manage, @jason_luffy
      assert @jason_ability.can? :manage, @jason_item
      deny @jason_ability.can? :manage, @steph_splatoon
      deny @jason_ability.can? :manage, @larry_c1
      deny @jason_ability.can? :manage, @larry_ninja_headband
    end
  end
end
