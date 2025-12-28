class CreateUserItems < ActiveRecord::Migration[7.2]
  def change
    create_table :user_items do |t|
      t.references :user, null: false, foreign_key: true
      t.references :item, null: false, foreign_key: true
      t.boolean :purchased, default: false
      t.integer :rating
      t.string :review

      t.timestamps
    end
  end
end
