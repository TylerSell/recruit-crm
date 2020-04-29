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

ActiveRecord::Schema.define(version: 2020_04_29_163410) do

  create_table "candidates", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "phone_number"
    t.string "address_1"
    t.string "address_2"
    t.string "city"
    t.string "state"
    t.string "zip_code"
    t.string "date_of_birth"
    t.string "interview_date"
    t.string "test_date"
    t.string "stage"
    t.boolean "affidavit_sent", default: false
    t.boolean "affidavit_received", default: false
    t.boolean "voucher_sent", default: false
    t.boolean "test_passed", default: false
    t.boolean "licensed", default: false
    t.integer "agent_id"
    t.integer "recruiter_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["agent_id"], name: "index_candidates_on_agent_id"
    t.index ["recruiter_id"], name: "index_candidates_on_recruiter_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "type", null: false
    t.string "first_name"
    t.string "last_name"
    t.string "phone_number"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "candidates", "agents"
  add_foreign_key "candidates", "recruiters"
end
