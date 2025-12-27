class CreateUserMedia < ActiveRecord::Migration[7.2]
  def change
    create_table :user_media do |t|
      t.references :user, null: false, foreign_key: true
      t.references :medium, null: false, foreign_key: true

      t.timestamps
    end
  end
end
