# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_06_02_044848) do

  create_table "admins", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "name", null: false
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "cart_items", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "cart_id", null: false
    t.integer "product_id", null: false
    t.integer "quantity", default: 1, null: false
  end

  create_table "carts", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id", null: false
    t.boolean "juge_use", default: true
  end

  create_table "favorites", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id", null: false
    t.integer "product_id", null: false
  end

  create_table "histories", force: :cascade do |t|
    t.integer "user_id", null: false
    t.string "shopping_postal_code", null: false
    t.string "shopping_prefecture", null: false
    t.string "shopping_city", null: false
    t.string "shopping_adress", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "history_items", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "product_status", default: 1, null: false
    t.integer "product_id", null: false
    t.integer "product_price", null: false
    t.integer "user_id", null: false
    t.integer "history_id", null: false
    t.integer "quantity"
  end

  create_table "lp_images", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "image_id", default: 0, null: false
  end

  create_table "movie_reviews", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "movie_id", null: false
    t.integer "user_id", null: false
    t.integer "rate", null: false
  end

  create_table "movies", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image_id", null: false
    t.string "title", null: false
    t.text "url"
    t.text "detail", null: false
  end

  create_table "product_reviews", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "product_id", null: false
    t.integer "user_id", null: false
    t.integer "rate", null: false
  end

  create_table "products", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image_id", null: false
    t.string "product_title", null: false
    t.integer "price", null: false
    t.string "label_name", null: false
    t.integer "stock", null: false
    t.index ["product_title"], name: "index_products_on_product_title"
  end

  create_table "tracks", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "product_id", null: false
    t.string "track_name", null: false
    t.string "artist_name", null: false
    t.integer "disk_num", default: 1, null: false
    t.integer "track_order", default: 1, null: false
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "name", null: false
    t.string "phonetic_name", null: false
    t.string "postal_code", null: false
    t.string "prefecture", null: false
    t.string "city", null: false
    t.string "adress", null: false
    t.string "phone_number", null: false
    t.datetime "deleted_at"
    t.string "image_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
