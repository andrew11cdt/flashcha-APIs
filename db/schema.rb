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

ActiveRecord::Schema.define(version: 2020_02_01_110926) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "pgcrypto"
  enable_extension "plpgsql"

  create_table "card_translations", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.text "meaning"
    t.string "sino_vi"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "ex_meaning"
    t.uuid "flash_card_id"
    t.uuid "language_id"
    t.index ["created_at"], name: "index_card_translations_on_created_at"
    t.index ["flash_card_id"], name: "index_card_translations_on_flash_card_id"
    t.index ["language_id"], name: "index_card_translations_on_language_id"
  end

  create_table "courses", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.uuid "level_id"
    t.uuid "language_id"
    t.index ["created_at"], name: "index_courses_on_created_at"
    t.index ["language_id"], name: "index_courses_on_language_id"
    t.index ["level_id"], name: "index_courses_on_level_id"
  end

  create_table "flash_cards", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "word"
    t.string "hiragana"
    t.string "sino"
    t.string "ipa"
    t.text "example"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.uuid "lesson_id"
    t.index ["created_at"], name: "index_flash_cards_on_created_at"
    t.index ["lesson_id"], name: "index_flash_cards_on_lesson_id"
  end

  create_table "imports", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "languages", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name", null: false
    t.string "lang_code", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "lessons", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.uuid "course_id"
    t.index ["course_id"], name: "index_lessons_on_course_id"
    t.index ["created_at"], name: "index_lessons_on_created_at"
  end

  create_table "levels", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name"
    t.integer "difficulty"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "lvl_no", default: 1
    t.uuid "parent_lvl_id"
  end

  add_foreign_key "card_translations", "flash_cards"
  add_foreign_key "card_translations", "languages"
  add_foreign_key "courses", "languages"
  add_foreign_key "courses", "levels"
  add_foreign_key "flash_cards", "lessons"
  add_foreign_key "lessons", "courses"
end
