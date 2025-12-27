class CreateUserMedia < ActiveRecord::Migration[7.2]
  def change
    create_table :user_media do |t|
      t.references :username, null: false, foreign_key: true
      t.references :media, null: false, foreign_key: true

      t.timestamps
    end
  end
end
