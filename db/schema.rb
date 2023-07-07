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

ActiveRecord::Schema[7.0].define(version: 2023_07_07_000630) do
  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

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

  create_table "hoteliers", force: :cascade do |t|
    t.string "name"
    t.string "cpf"
    t.string "phone_number"
    t.string "plan"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "photos", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.json "images"
    t.text "description"
  end

  create_table "rooms", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.string "reference"
    t.integer "maximum_capacity"
    t.string "status"
    t.string "photo_1"
    t.string "photo_2"
    t.string "photo_3"
    t.string "photo_4"
    t.boolean "is_double"
    t.boolean "is_triple"
    t.boolean "is_quadruple"
    t.boolean "is_quintuple"
    t.boolean "is_sextuple"
    t.boolean "is_single"
    t.boolean "is_couple"
    t.boolean "is_couple_plus_one"
    t.boolean "is_couple_plus_two"
    t.boolean "is_couple_plus_three"
    t.boolean "is_couple_plus_four"
    t.boolean "is_two_couples"
    t.boolean "is_two_couples_plus_one"
    t.boolean "is_two_couples_plus_two"
    t.boolean "is_three_couples"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "trips", force: :cascade do |t|
    t.integer "establishment_id", null: false
    t.integer "guide_id", null: false
    t.date "checkin_date"
    t.time "checkin_time"
    t.date "checkout_date"
    t.time "checkout_time"
    t.boolean "extra_coffee"
    t.integer "num_people"
    t.integer "num_drivers"
    t.boolean "free_driver"
    t.integer "num_guides"
    t.boolean "free_guide"
    t.integer "num_rooms"
    t.float "rate_person_day"
    t.float "signal_value"
    t.date "signal_date"
    t.text "notes"
    t.boolean "confirmed"
    t.boolean "accomplished"
    t.boolean "suspended"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["establishment_id"], name: "index_trips_on_establishment_id"
    t.index ["guide_id"], name: "index_trips_on_guide_id"
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

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "establishments", "hoteliers"
  add_foreign_key "trips", "establishments"
  add_foreign_key "trips", "guides"
end
