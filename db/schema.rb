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

ActiveRecord::Schema.define(version: 2022_06_08_035805) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bookmarks", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "dish_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["dish_id"], name: "index_bookmarks_on_dish_id"
    t.index ["user_id"], name: "index_bookmarks_on_user_id"
  end

  create_table "dishes", force: :cascade do |t|
    t.string "name"
    t.float "price"
    t.text "description"
    t.string "dish_type"
    t.bigint "stall_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["stall_id"], name: "index_dishes_on_stall_id"
  end

  create_table "flavors", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "hawker_centers", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "review_flavors", force: :cascade do |t|
    t.bigint "flavor_id", null: false
    t.bigint "review_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["flavor_id"], name: "index_review_flavors_on_flavor_id"
    t.index ["review_id"], name: "index_review_flavors_on_review_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.text "comment"
    t.integer "rating"
    t.bigint "user_id", null: false
    t.bigint "dish_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["dish_id"], name: "index_reviews_on_dish_id"
    t.index ["user_id"], name: "index_reviews_on_user_id"
  end

  create_table "stalls", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "unit"
    t.bigint "user_id", null: false
    t.bigint "hawker_center_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["hawker_center_id"], name: "index_stalls_on_hawker_center_id"
    t.index ["user_id"], name: "index_stalls_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "username"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "bookmarks", "dishes"
  add_foreign_key "bookmarks", "users"
  add_foreign_key "dishes", "stalls"
  add_foreign_key "review_flavors", "flavors"
  add_foreign_key "review_flavors", "reviews"
  add_foreign_key "reviews", "dishes"
  add_foreign_key "reviews", "users"
  add_foreign_key "stalls", "hawker_centers"
  add_foreign_key "stalls", "users"
end
