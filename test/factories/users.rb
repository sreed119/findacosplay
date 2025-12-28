FactoryBot.define do
  factory :user do
    sequence :username do |n|
      "user#{n}"
    end
    password { "secret" }
    password_confirmation { "secret" }
    role { 2 } # default to 'user' role
    sequence :email do |n|
      "user#{n}@example.com"
    end
  end
end
