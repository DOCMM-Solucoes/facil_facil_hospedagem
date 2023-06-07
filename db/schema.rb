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

ActiveRecord::Schema[7.0].define(version: 2023_06_06_153544) do
  create_table "addresses", force: :cascade do |t|
    t.string "street"
    t.string "postal_code"
    t.string "city"
    t.string "state"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "addressable_type"
    t.integer "addressable_id"
    t.index %w[addressable_type addressable_id], name: "index_addresses_on_addressable"
  end

  create_table "establishments", force: :cascade do |t|
    t.string "name"
    t.string "qty_bedrooms"
    t.string "phone"
    t.string "site"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "hotelier_id", null: false
    t.index ["hotelier_id"], name: "index_establishments_on_hotelier_id"
  end

  create_table "guides", force: :cascade do |t|
    t.string "name"
    t.string "phone"
    t.string "cpf"
    t.string "company"
    t.string "cnpj"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "guides_establishments", force: :cascade do |t|
    t.integer "guides_id"
    t.integer "establishments_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["establishments_id"], name: "index_guides_establishments_on_establishments_id"
    t.index ["guides_id"], name: "index_guides_establishments_on_guides_id"
  end

  create_table "hoteliers", force: :cascade do |t|
    t.string "name"
    t.string "cpf"
    t.string "phone_number"
    t.string "plan"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "establishments", "hoteliers"
end
