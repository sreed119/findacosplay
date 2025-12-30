module Contexts
  module Abilities
    def create_admin_abilities
      create_users
      create_media
      create_characters
      create_items
      create_user_media
      create_user_characters
      create_user_items

      @malia = FactoryBot.create(:user, username: "malia", email: "malia@example.com", role: "admin")
      @malia_onepiece = FactoryBot.create(:user_medium, user: @malia, medium: @onepiece)
      @malia_nami = FactoryBot.create(:user_character, user: @malia, character: @c_nami)
      @malia_strawhat = FactoryBot.create(:user_item, user: @malia, item: @strawhat)
      @malia_ability = ::Ability.new(@malia)
    end

    def delete_admin_abilities
      @malia.destroy

      destroy_user_items
      destroy_user_characters
      destroy_user_media
      destroy_items
      destroy_characters
      destroy_media
      destroy_users
    end

    def create_user_abilities
      create_users
      create_media
      create_characters
      create_items
      create_user_media
      create_user_characters
      create_user_items

      @jason = FactoryBot.create(:user, username: "jason")
      @jason_onepiece = FactoryBot.create(:user_medium, user: @jason, medium: @onepiece)
      @jason_luffy = FactoryBot.create(:user_character, user: @jason, character: @c_luffy)
      @jason_item = FactoryBot.create(:user_item, user: @jason, item: @strawhat)
      @jason_ability = ::Ability.new(@jason)
    end

    def delete_user_abilities
      @jason_item.delete
      @jason_luffy.delete
      @jason_onepiece.delete
      @jason.destroy

      destroy_user_items
      destroy_user_characters
      destroy_user_media
      destroy_items
      destroy_characters
      destroy_media
      destroy_users
    end

    def create_guest_abilities
      @guest_user = User.new
      @guest_ability = ::Ability.new(@guest_user)
    end

    def delete_guest_abilities
    end
  end
end
