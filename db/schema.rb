# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20160309024552) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "candies", force: :cascade do |t|
    t.string   "title"
    t.string   "description"
    t.integer  "price"
    t.string   "image"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.integer  "category_id"
    t.string   "status"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  create_table "candy_orders", force: :cascade do |t|
    t.integer "candy_id"
    t.integer "order_id"
    t.integer "quantity"
    t.integer "sub_total"
  end

  add_index "candy_orders", ["candy_id"], name: "index_candy_orders_on_candy_id", using: :btree
  add_index "candy_orders", ["order_id"], name: "index_candy_orders_on_order_id", using: :btree

  create_table "categories", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "name"
  end

  create_table "orders", force: :cascade do |t|
    t.string   "status"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "orders", ["user_id"], name: "index_orders_on_user_id", using: :btree

  create_table "reviews", force: :cascade do |t|
    t.integer "rating"
    t.string  "candy_id"
    t.string  "review"
    t.string  "name"
  end

  create_table "users", force: :cascade do |t|
    t.string  "username"
    t.string  "password_digest"
    t.string  "name"
    t.integer "role",            default: 0
  end

  add_foreign_key "candy_orders", "candies"
  add_foreign_key "candy_orders", "orders"
  add_foreign_key "orders", "users"
end
