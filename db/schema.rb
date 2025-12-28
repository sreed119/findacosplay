# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.2].define(version: 2025_12_27_211645) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "character_items", force: :cascade do |t|
    t.bigint "character_id", null: false
    t.bigint "item_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["character_id"], name: "index_character_items_on_character_id"
    t.index ["item_id"], name: "index_character_items_on_item_id"
  end

  create_table "characters", force: :cascade do |t|
    t.string "name"
    t.bigint "medium_id", null: false
    t.string "image"
    t.string "hair_color"
    t.integer "hair_length"
    t.string "eye_color"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["medium_id"], name: "index_characters_on_medium_id"
  end

  create_table "items", force: :cascade do |t|
    t.string "name"
    t.string "store"
    t.string "item_link"
    t.float "price"
    t.integer "category"
    t.boolean "active", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "media", force: :cascade do |t|
    t.string "name"
    t.integer "media_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_characters", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "character_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["character_id"], name: "index_user_characters_on_character_id"
    t.index ["user_id"], name: "index_user_characters_on_user_id"
  end

  create_table "user_items", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "item_id", null: false
    t.boolean "purchased", default: false
    t.integer "rating"
    t.string "review"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["item_id"], name: "index_user_items_on_item_id"
    t.index ["user_id"], name: "index_user_items_on_user_id"
  end

  create_table "user_media", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "medium_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["medium_id"], name: "index_user_media_on_medium_id"
    t.index ["user_id"], name: "index_user_media_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "email"
    t.string "password_digest"
    t.string "profile_picture"
    t.integer "role"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "character_items", "characters"
  add_foreign_key "character_items", "items"
  add_foreign_key "characters", "media"
  add_foreign_key "user_characters", "characters"
  add_foreign_key "user_characters", "users"
  add_foreign_key "user_items", "items"
  add_foreign_key "user_items", "users"
  add_foreign_key "user_media", "media"
  add_foreign_key "user_media", "users"
end
