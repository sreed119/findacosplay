module Contexts
  module Characters
    def create_characters
      @c_naruto = FactoryBot.create(:character, name: "Naruto Uzumaki", medium: @naruto, hair_length: 1, hair_color: "Yellow", eye_color: "Blue")
      @c_luffy = FactoryBot.create(:character, name: "Monkey D. Luffy", medium: @onepiece)
      @c_nami = FactoryBot.create(:character, name: "Nami", medium: @onepiece, hair_length: 2, hair_color: "Orange")
    end
  end
end
