module Contexts
  module Characters
    def create_characters
      @c_naruto = FactoryBot.create(:character, name: "Naruto Uzumaki", medium: @naruto, hair_length: 1, hair_color: "Yellow", eye_color: "Blue")
      @c_sasuke = FactoryBot.create(:character, name: "Sasuke Uchiha", medium: @naruto, hair_length: 2, hair_color: "Black", eye_color: "Black")
      @c_luffy = FactoryBot.create(:character, name: "Monkey D. Luffy", medium: @onepiece)
      @c_nami = FactoryBot.create(:character, name: "Nami", medium: @onepiece, hair_length: 2, hair_color: "Orange")
    end

    def delete_characters
      @c_naruto.delete
      @c_sasuke.delete
      @c_luffy.delete
      @c_nami.delete
    end
  end
end
