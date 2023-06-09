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

ActiveRecord::Schema[7.0].define(version: 2023_05_25_135603) do
  create_table "carts", force: :cascade do |t|
    t.integer "profile_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["profile_id"], name: "index_carts_on_profile_id"
  end

  create_table "order_statuses", force: :cascade do |t|
    t.string "title"
    t.integer "status_id"
    t.integer "order_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["order_id"], name: "index_order_statuses_on_order_id"
  end

  create_table "ordered_products", force: :cascade do |t|
    t.integer "cart_id"
    t.integer "product_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "order_id"
    t.index ["cart_id"], name: "index_ordered_products_on_cart_id"
    t.index ["order_id"], name: "index_ordered_products_on_order_id"
    t.index ["product_id"], name: "index_ordered_products_on_product_id"
  end

  create_table "orders", force: :cascade do |t|
    t.integer "profile_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["profile_id"], name: "index_orders_on_profile_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "title"
    t.float "price"
    t.integer "count"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "tag_id"
    t.index ["tag_id"], name: "index_products_on_tag_id"
  end

  create_table "profile_statuses", force: :cascade do |t|
    t.string "title"
    t.integer "access_level"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "profiles", force: :cascade do |t|
    t.string "name"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "profile_statuses_id"
    t.index ["profile_statuses_id"], name: "index_profiles_on_profile_statuses_id"
  end

  create_table "tags", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
