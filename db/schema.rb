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

ActiveRecord::Schema[7.0].define(version: 2023_07_31_160754) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

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

  create_table "appointments", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "patient"
    t.date "appointment_date"
    t.string "doctor_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "doctor_id"
    t.index ["user_id"], name: "index_appointments_on_user_id"
  end

  create_table "articles", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.date "publish_date"
    t.string "readtime"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "content"
    t.string "quote"
    t.bigint "user_id"
    t.string "keywords", array: true
    t.index ["user_id", "created_at"], name: "index_articles_on_user_id_and_created_at"
  end

  create_table "choices", force: :cascade do |t|
    t.string "name"
    t.string "choice_text"
    t.integer "id_mood"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "infos", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.text "biography"
    t.string "speciality", default: [], array: true
    t.string "experience"
    t.string "contact", default: [], array: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_infos_on_user_id"
  end

  create_table "moods", force: :cascade do |t|
    t.string "name"
    t.date "day"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "description"
    t.index ["user_id"], name: "index_moods_on_user_id"
  end

  create_table "situation_choices", force: :cascade do |t|
    t.bigint "situation_id", null: false
    t.bigint "choice_id", null: false
    t.boolean "outcome"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["choice_id"], name: "index_situation_choices_on_choice_id"
    t.index ["situation_id"], name: "index_situation_choices_on_situation_id"
  end

  create_table "situations", force: :cascade do |t|
    t.string "name"
    t.string "story_text"
    t.integer "id_mood"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
    t.string "remember_digest"
    t.boolean "doctor", default: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "appointments", "users"
  add_foreign_key "appointments", "users", column: "doctor_id"
  add_foreign_key "articles", "users"
  add_foreign_key "infos", "users"
  add_foreign_key "moods", "users"
  add_foreign_key "situation_choices", "choices"
  add_foreign_key "situation_choices", "situations"
end
