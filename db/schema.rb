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

ActiveRecord::Schema.define(version: 20180320012255) do

  create_table "price_ranges", force: :cascade do |t|
    t.string "description"
    t.datetime "start_date"
    t.datetime "end_date"
    t.decimal "daily_rate"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "property_id"
    t.index ["property_id"], name: "index_price_ranges_on_property_id"
  end

  create_table "properties", force: :cascade do |t|
    t.string "title"
    t.integer "maximum_guests"
    t.integer "minimum_rent"
    t.integer "maximum_rent"
    t.decimal "daily_rate"
    t.string "rent_purpose"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "description"
    t.string "neighborhood"
    t.boolean "accessibility"
    t.boolean "allow_pets"
    t.boolean "allow_smokers"
    t.integer "rooms"
    t.integer "property_location_id"
    t.integer "property_owner_id"
    t.string "main_photo_file_name"
    t.string "main_photo_content_type"
    t.integer "main_photo_file_size"
    t.datetime "main_photo_updated_at"
    t.index ["property_location_id"], name: "index_properties_on_property_location_id"
    t.index ["property_owner_id"], name: "index_properties_on_property_owner_id"
  end

  create_table "property_locations", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "property_owners", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_property_owners_on_email", unique: true
    t.index ["reset_password_token"], name: "index_property_owners_on_reset_password_token", unique: true
  end

  create_table "proposals", force: :cascade do |t|
    t.text "rent_purpose"
    t.integer "total_guest"
    t.date "start_date"
    t.date "end_date"
    t.boolean "pet"
    t.boolean "smoker"
    t.decimal "total_amount"
    t.text "details"
    t.integer "property_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.integer "status", default: 0
    t.index ["property_id"], name: "index_proposals_on_property_id"
    t.index ["user_id"], name: "index_proposals_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.string "phone"
    t.string "photo_file_name"
    t.string "photo_content_type"
    t.integer "photo_file_size"
    t.datetime "photo_updated_at"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
