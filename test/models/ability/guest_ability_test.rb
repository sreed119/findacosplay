require "test_helper"

class GuestAbilityTest < ActiveSupport::TestCase
  context "Within context" do
    should "be able to read basic models" do
      create_guest_abilities
      deny @guest_ability.can? :manage, :all
      assert @guest_ability.can? :read, Item
      assert @guest_ability.can? :read, Medium
      assert @guest_ability.can? :read, Character
      assert @guest_ability.can? :create, User
    end
  end
end
