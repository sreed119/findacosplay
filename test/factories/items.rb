FactoryBot.define do
  factory :item do
    sequence :name do |n|
      "Item #{n}"
    end
    category { "clothing" }
    item_link { "http://www.example.com/item" }
    store { "Example Store" }
    price { 19.99 }
    active { true }
  end
end
