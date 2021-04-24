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

ActiveRecord::Schema.define(version: 2021_04_24_190138) do

  create_table "attractions", force: :cascade do |t|
    t.string "name"
    t.float "x"
    t.float "y"
    t.float "price"
    t.string "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "time"
  end

  create_table "attractions_categories", id: false, force: :cascade do |t|
    t.integer "attraction_id", null: false
    t.integer "category_id", null: false
  end

  create_table "attractions_tours", id: false, force: :cascade do |t|
    t.integer "attraction_id", null: false
    t.integer "tour_id", null: false
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "discounts", force: :cascade do |t|
    t.string "name"
    t.decimal "percent"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "guides", force: :cascade do |t|
    t.string "name"
    t.string "surname"
    t.integer "telnumber"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "tours", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "guide_id", null: false
    t.index ["guide_id"], name: "index_tours_on_guide_id"
  end

  create_table "tours_users", id: false, force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "tour_id", null: false
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "email", null: false
    t.string "encrypted_password", limit: 128, null: false
    t.string "confirmation_token", limit: 128
    t.string "remember_token", limit: 128, null: false
    t.index ["email"], name: "index_users_on_email"
    t.index ["remember_token"], name: "index_users_on_remember_token"
  end

  add_foreign_key "attractions_categories", "attractions"
  add_foreign_key "attractions_categories", "categories"
  add_foreign_key "attractions_tours", "attractions"
  add_foreign_key "attractions_tours", "tours"
  add_foreign_key "tours", "guides"
  add_foreign_key "tours_users", "tours"
  add_foreign_key "tours_users", "users"
end
