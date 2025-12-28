module Contexts
  module Media
    def create_media
      @naruto = FactoryBot.create(:medium, name: "Naruto", media_type: "animanga")
      @onepiece = FactoryBot.create(:medium, name: "One Piece", media_type: "animanga")
      @splatoon = FactoryBot.create(:medium, name: "Splatoon", media_type: "game")
      @gravityfalls = FactoryBot.create(:medium, name: "Gravity Falls", media_type: "cartoon")
    end
  end
end
