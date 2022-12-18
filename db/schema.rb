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

ActiveRecord::Schema[7.0].define(version: 2022_12_18_133608) do
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

  create_table "certificates", force: :cascade do |t|
    t.string "title", null: false
    t.string "link", null: false
    t.date "achieved_date", null: false
    t.date "expiration_date"
    t.bigint "user_id", null: false
    t.bigint "technology_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["technology_id"], name: "index_certificates_on_technology_id"
    t.index ["title"], name: "index_certificates_on_title"
    t.index ["user_id"], name: "index_certificates_on_user_id"
  end

  create_table "comments", force: :cascade do |t|
    t.string "content", null: false
    t.bigint "user_id", null: false
    t.string "username", null: false
    t.bigint "study_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["study_id"], name: "index_comments_on_study_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "likes", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "study_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["study_id"], name: "index_likes_on_study_id"
    t.index ["user_id"], name: "index_likes_on_user_id"
  end

  create_table "professions", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "technology_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["technology_id"], name: "index_professions_on_technology_id"
    t.index ["user_id"], name: "index_professions_on_user_id"
  end

  create_table "studies", force: :cascade do |t|
    t.string "topic", null: false
    t.text "experience"
    t.boolean "completed", default: false
    t.integer "hours_taken", default: 0, null: false
    t.integer "like_count", default: 0, null: false
    t.integer "comment_count", default: 0, null: false
    t.bigint "user_id", null: false
    t.bigint "technology_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["technology_id"], name: "index_studies_on_technology_id"
    t.index ["topic"], name: "index_studies_on_topic"
    t.index ["user_id"], name: "index_studies_on_user_id"
  end

  create_table "technologies", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "username", null: false
    t.string "fullname", null: false
    t.string "email", null: false
    t.string "password_digest"
    t.string "catchphrase", null: false
    t.string "goal", null: false
    t.integer "views", default: 0
    t.text "bio"
    t.string "city", null: false
    t.date "birthdate", null: false
    t.string "phone", null: false
    t.string "role", default: "learner", null: false
    t.string "github"
    t.string "linkedin"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["username"], name: "index_users_on_username"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "certificates", "technologies"
  add_foreign_key "certificates", "users"
  add_foreign_key "comments", "studies"
  add_foreign_key "comments", "users"
  add_foreign_key "likes", "studies"
  add_foreign_key "likes", "users"
  add_foreign_key "professions", "technologies"
  add_foreign_key "professions", "users"
  add_foreign_key "studies", "technologies"
  add_foreign_key "studies", "users"
end
