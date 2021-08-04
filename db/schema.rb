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

ActiveRecord::Schema.define(version: 2021_08_04_153952) do

  create_table "dog_foods", force: :cascade do |t|
    t.integer "dog_id", null: false
    t.integer "food_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["dog_id", "food_id"], name: "index_dog_foods_on_dog_id_and_food_id", unique: true
    t.index ["dog_id"], name: "index_dog_foods_on_dog_id"
    t.index ["food_id"], name: "index_dog_foods_on_food_id"
  end

  create_table "dogs", force: :cascade do |t|
    t.string "name"
    t.integer "weight"
    t.date "birthdate"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name"], name: "index_dogs_on_name", unique: true
  end

  create_table "foods", force: :cascade do |t|
    t.string "name"
    t.integer "food_type", null: false
    t.float "weight"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "dog_foods", "dogs"
  add_foreign_key "dog_foods", "foods"
end
