FactoryBot.define do
  factory :user_medium do
    association :user
    association :medium
  end
end
