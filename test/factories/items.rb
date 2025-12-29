FactoryBot.define do
  factory :item do
    sequence :name do |n|
      "Item #{n}"
    end
    category { "clothing" }
    sequence :item_link do |m|
      "https://www.example.com/item#{m}"
    end
    store { "Example Store" }
    price { 19.99 }
    active { true }
  end
end
