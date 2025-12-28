FactoryBot.define do
  factory :medium do
    sequence :name do |n|
      "Generic Anime ##{n}"
    end
    media_type { 1 }
  end
end
