FactoryBot.define do
  factory :user_character do
    association :user
    association :character
  end
end
