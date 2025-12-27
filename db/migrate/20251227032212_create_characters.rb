class CreateCharacters < ActiveRecord::Migration[7.2]
  def change
    create_table :characters do |t|
      t.string :name
      t.references :media, null: false, foreign_key: true
      t.string :image
      t.string :hair_color
      t.integer :hair_length
      t.string :eye_color

      t.timestamps
    end
  end
end
