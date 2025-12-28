module Contexts
  module Items
    def create_items
      @strawhat = FactoryBot.create(:item, name: "Straw Hat", store: "Amazon", category: "hat", price: 7.99)
      @ninja_headband = FactoryBot.create(:item, name: "Ninja Headband", store: "Etsy", category: "accessory", price: 12.50)
    end
  end
end
