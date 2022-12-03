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

ActiveRecord::Schema[7.0].define(version: 2022_11_30_033601) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

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
    t.string "like_count", default: "0", null: false
    t.string "comment_count", default: "0", null: false
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
    t.string "user_count", default: "0", null: false
    t.string "study_count", default: "0", null: false
    t.string "certificate_count", default: "0", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "username", null: false
    t.string "fullname", null: false
    t.string "email", null: false
    t.string "password_digest"
    t.string "goal", null: false
    t.string "image"
    t.text "bio"
    t.string "city", null: false
    t.date "birthdate", null: false
    t.string "phone", null: false
    t.string "role", default: "learner", null: false
    t.string "github"
    t.string "linkedin"
    t.string "tech_count", default: "0", null: false
    t.string "study_count", default: "0", null: false
    t.string "certificate_count", default: "0", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["username"], name: "index_users_on_username"
  end

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
