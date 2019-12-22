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

ActiveRecord::Schema.define(version: 2019_12_22_092026) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "card_translations", force: :cascade do |t|
    t.bigint "flash_card_id"
    t.text "meaning"
    t.string "sino_vi"
    t.bigint "language_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["flash_card_id"], name: "index_card_translations_on_flash_card_id"
    t.index ["language_id"], name: "index_card_translations_on_language_id"
  end

  create_table "courses", force: :cascade do |t|
    t.string "name"
    t.bigint "level_id"
    t.bigint "language_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["language_id"], name: "index_courses_on_language_id"
    t.index ["level_id"], name: "index_courses_on_level_id"
  end

  create_table "flash_cards", force: :cascade do |t|
    t.bigint "lesson_id"
    t.string "word"
    t.string "hiragana"
    t.string "sino"
    t.string "ipa"
    t.text "example"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["lesson_id"], name: "index_flash_cards_on_lesson_id"
  end

  create_table "languages", force: :cascade do |t|
    t.string "name", null: false
    t.string "lang_code", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "lessons", force: :cascade do |t|
    t.string "name"
    t.bigint "course_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["course_id"], name: "index_lessons_on_course_id"
  end

  create_table "levels", force: :cascade do |t|
    t.string "name"
    t.bigint "parent_lvl_id"
    t.integer "level", default: 1
    t.integer "difficulty"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["parent_lvl_id"], name: "index_levels_on_parent_lvl_id"
  end

end
