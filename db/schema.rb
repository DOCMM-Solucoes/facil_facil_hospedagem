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

ActiveRecord::Schema[7.0].define(version: 2023_05_27_175323) do
  create_table "addresses", force: :cascade do |t|
    t.string "street"
    t.string "postal_code"
    t.string "city"
    t.string "state"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "addressable_type"
    t.integer "addressable_id"
    t.index ["addressable_type", "addressable_id"], name: "index_addresses_on_addressable"
  end

  create_table "establishments", force: :cascade do |t|
    t.string "name"
    t.string "qty_bedrooms"
    t.string "phone"
    t.string "site"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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

  create_table "hoteliers", force: :cascade do |t|
    t.string "name"
    t.string "cpf"
    t.string "phone_number"
    t.string "plan"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
