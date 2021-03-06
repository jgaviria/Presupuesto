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

ActiveRecord::Schema.define(version: 20150104171426) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bills", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "bill_id"
  end

  create_table "budgets", force: true do |t|
    t.decimal  "income"
    t.decimal  "savings"
    t.decimal  "housing"
    t.decimal  "utilities"
    t.decimal  "food"
    t.decimal  "transportation"
    t.decimal  "clothing"
    t.decimal  "personal"
    t.decimal  "recreation"
    t.decimal  "debt"
    t.decimal  "kids"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "session"
    t.string   "budget_name"
  end

  create_table "credit_cards", force: true do |t|
    t.string   "name"
    t.integer  "total_owed"
    t.integer  "paid"
    t.integer  "subtotal"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "product_id"
    t.integer  "bill_id"
  end

  create_table "house_bills", force: true do |t|
    t.string   "name"
    t.integer  "total_owed"
    t.integer  "paid"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "bill_id"
  end

  create_table "houses", force: true do |t|
    t.string   "name"
    t.integer  "owed"
    t.integer  "paid"
    t.integer  "total"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "bill_id"
    t.string   "session_name"
  end

  create_table "product_fields", force: true do |t|
    t.string   "name"
    t.string   "field_type"
    t.boolean  "required"
    t.integer  "product_type_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "product_fields", ["product_type_id"], name: "index_product_fields_on_product_type_id", using: :btree

  create_table "product_types", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "productos", force: true do |t|
    t.string   "name"
    t.integer  "price"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "products", force: true do |t|
    t.string   "name"
    t.decimal  "price"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "product_id"
  end

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "password_digest"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
