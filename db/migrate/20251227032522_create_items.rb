class CreateItems < ActiveRecord::Migration[7.2]
  def change
    create_table :items do |t|
      t.string :name
      t.string :store
      t.string :item_link
      t.float :price
      t.integer :category
      t.boolean :active, default: true

      t.timestamps
    end
  end
end
