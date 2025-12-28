FactoryBot.define do
  factory :user_item do
    association :user
    association :item
    purchased { false }
    rating { nil }
    review { nil }
  end
end
