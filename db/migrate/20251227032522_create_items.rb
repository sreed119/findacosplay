class CreateItems < ActiveRecord::Migration[7.2]
  def change
    create_table :items do |t|
      t.string :name
      t.references :character, null: false, foreign_key: true
      t.string :store
      t.string :item_link
      t.float :price
      t.integer :category
      t.boolean :active, default: true

      t.timestamps
    end
  end
end
