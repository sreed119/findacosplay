module Contexts
  module Items
    def create_items
      @strawhat = FactoryBot.create(:item, name: "Straw Hat", store: "Amazon", category: "hat", price: 7.99)
      @ninja_headband = FactoryBot.create(:item, name: "Ninja Headband", store: "Etsy", category: "accessory", price: 12.50)
      @splattershot = FactoryBot.create(:item, name: "Splattershot", store: "GameStop", category: "prop", price: 29.99, active: false)
    end

    def destroy_items
      @strawhat.delete
      @ninja_headband.delete
      @splattershot.delete
    end
  end
end
