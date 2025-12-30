require "test_helper"

class AdminAbilityTest < ActiveSupport::TestCase
  context "Within context" do
    should "be able to manage all models except user associations" do
      create_admin_abilities
      deny @malia_ability.can? :manage, :all
      assert @malia_ability.can? :manage, Item
      assert @malia_ability.can? :manage, Medium
      assert @malia_ability.can? :manage, Character
      assert @malia_ability.can? :manage, User
      assert @malia_ability.can? :manage, CharacterItem

      assert @malia_ability.can? :manage, @malia_onepiece
      assert @malia_ability.can? :manage, @malia_nami
      assert @malia_ability.can? :manage, @malia_strawhat
      deny @malia_ability.can? :manage, @larry_naruto
      deny @malia_ability.can? :manage, @steph_c1
      deny @malia_ability.can? :manage, @larry_ninja_headband
    end
  end
end
