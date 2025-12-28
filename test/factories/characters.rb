FactoryBot.define do
  factory :character do
    sequence :name do |n|
      "Character#{n}"
    end
    image { "http://example.com/character.jpg" }
    hair_length { 1 }
    hair_color { "Black" }
    eye_color { "Brown" }
    association :medium
  end
end
