# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_05_13_193039) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "asset_id", null: false
    t.float "balance"
    t.string "address_sequence"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["address_sequence"], name: "index_addresses_on_address_sequence", unique: true
    t.index ["asset_id"], name: "index_addresses_on_asset_id"
    t.index ["user_id"], name: "index_addresses_on_user_id"
  end

  create_table "assets", force: :cascade do |t|
    t.string "name"
    t.float "price"
    t.string "logo"
    t.string "ticker"
    t.text "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "contacts", force: :cascade do |t|
    t.bigint "user_1_id", null: false
    t.bigint "user_2_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_1_id"], name: "index_contacts_on_user_1_id"
    t.index ["user_2_id"], name: "index_contacts_on_user_2_id"
  end

  create_table "transactions", force: :cascade do |t|
    t.string "category"
    t.float "receiving_amount"
    t.float "sending_amount"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "receiving_address"
    t.string "sending_address"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "name"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "addresses", "assets"
  add_foreign_key "addresses", "users"
  add_foreign_key "contacts", "users", column: "user_1_id"
  add_foreign_key "contacts", "users", column: "user_2_id"
  add_foreign_key "transactions", "addresses", column: "receiving_address", primary_key: "address_sequence"
  add_foreign_key "transactions", "addresses", column: "sending_address", primary_key: "address_sequence"
end
