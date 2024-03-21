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

ActiveRecord::Schema[7.1].define(version: 2024_03_20_102618) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "appointments", force: :cascade do |t|
    t.date "appointment_date"
    t.time "appointment_time"
    t.string "person_in_charge"
    t.bigint "donor_id", null: false
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "center_id"
    t.index ["center_id"], name: "index_appointments_on_center_id"
    t.index ["donor_id"], name: "index_appointments_on_donor_id"
  end

  create_table "centers", force: :cascade do |t|
    t.string "address"
    t.bigint "hospital_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.float "latitude"
    t.float "longitude"
    t.index ["hospital_id"], name: "index_centers_on_hospital_id"
  end

  create_table "days", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "donors", force: :cascade do |t|
    t.bigint "user_id"
    t.string "address"
    t.string "blood_type"
    t.date "birthdate"
    t.string "first_name"
    t.string "last_name"
    t.string "national_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_donors_on_user_id"
  end

  create_table "hospitals", force: :cascade do |t|
    t.bigint "user_id"
    t.string "hospital_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_hospitals_on_user_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.bigint "center_id", null: false
    t.bigint "donor_id", null: false
    t.float "rating"
    t.text "review_content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["center_id"], name: "index_reviews_on_center_id"
    t.index ["donor_id"], name: "index_reviews_on_donor_id"
  end

  create_table "schedules", force: :cascade do |t|
    t.time "opening_time"
    t.time "closing_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "day_id", null: false
    t.bigint "center_id"
    t.index ["center_id"], name: "index_schedules_on_center_id"
    t.index ["day_id"], name: "index_schedules_on_day_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "category"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "appointments", "centers"
  add_foreign_key "appointments", "donors"
  add_foreign_key "centers", "hospitals"
  add_foreign_key "donors", "users"
  add_foreign_key "hospitals", "users"
  add_foreign_key "reviews", "centers"
  add_foreign_key "reviews", "donors"
  add_foreign_key "schedules", "centers"
  add_foreign_key "schedules", "days"
end
