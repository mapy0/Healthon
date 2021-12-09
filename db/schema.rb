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

ActiveRecord::Schema.define(version: 2021_12_08_212201) do

  create_table "aims", force: :cascade do |t|
    t.float "aim_w"
    t.float "aim_bf"
    t.float "aim_mus"
    t.float "aim_sm"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "member_id"
  end

  create_table "diaries", force: :cascade do |t|
    t.integer "member_id", null: false
    t.string "title", null: false
    t.text "body", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date "date"
  end

  create_table "meals", force: :cascade do |t|
    t.integer "record_id", null: false
    t.date "date", null: false
    t.string "name", null: false
    t.integer "calorie", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "members", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "is_deleted", default: false
    t.string "self_introduction"
    t.string "image_id"
    t.index ["email"], name: "index_members_on_email", unique: true
    t.index ["reset_password_token"], name: "index_members_on_reset_password_token", unique: true
  end

  create_table "profiles", force: :cascade do |t|
    t.float "height", null: false
    t.date "birth", null: false
    t.integer "age", null: false
    t.integer "sex", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "member_id"
  end

  create_table "rec_images", force: :cascade do |t|
    t.integer "record_id", null: false
    t.integer "image_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "records", force: :cascade do |t|
    t.integer "member_id", null: false
    t.float "weight"
    t.float "bmi"
    t.float "bf"
    t.float "mm"
    t.float "mus"
    t.float "tbw"
    t.float "sm"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date "date"
  end

  create_table "workouts", force: :cascade do |t|
    t.integer "record_id", null: false
    t.date "date", null: false
    t.string "name", null: false
    t.integer "burned_calorie", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
