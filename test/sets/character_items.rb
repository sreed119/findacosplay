module Contexts
  module CharacterItems
    def create_character_items
      @naruto_headband = FactoryBot.create(:character_item, character: @c_naruto, item: @ninja_headband)
      @sasuke_headband = FactoryBot.create(:character_item, character: @c_sasuke, item: @ninja_headband)
      @luffy_strawhat = FactoryBot.create(:character_item, character: @c_luffy, item: @strawhat)
    end
  end
end
