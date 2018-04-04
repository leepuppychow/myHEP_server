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

ActiveRecord::Schema.define(version: 20180404052916) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "exercise_categories", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "exercise_id"
    t.bigint "category_id"
    t.index ["category_id"], name: "index_exercise_categories_on_category_id"
    t.index ["exercise_id"], name: "index_exercise_categories_on_exercise_id"
  end

  create_table "exercises", force: :cascade do |t|
    t.string "name"
    t.string "image"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "workout_exercises", force: :cascade do |t|
    t.integer "sets"
    t.integer "reps"
    t.integer "status", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "exercise_id"
    t.bigint "workout_id"
    t.index ["exercise_id"], name: "index_workout_exercises_on_exercise_id"
    t.index ["workout_id"], name: "index_workout_exercises_on_workout_id"
  end

  create_table "workouts", force: :cascade do |t|
    t.string "name"
    t.string "weekday"
    t.integer "status", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "therapist"
  end

  add_foreign_key "exercise_categories", "categories"
  add_foreign_key "exercise_categories", "exercises"
  add_foreign_key "workout_exercises", "exercises"
  add_foreign_key "workout_exercises", "workouts"
end
