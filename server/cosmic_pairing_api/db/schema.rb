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

ActiveRecord::Schema[7.1].define(version: 2024_01_02_075328) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "celestial_signs", force: :cascade do |t|
    t.integer "essential_dignity"
    t.bigint "celestial_id", null: false
    t.bigint "sign_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["celestial_id"], name: "index_celestial_signs_on_celestial_id"
    t.index ["sign_id"], name: "index_celestial_signs_on_sign_id"
  end

  create_table "celestials", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "type", default: "Planet", null: false
  end

  create_table "data_migrations", primary_key: "version", id: :string, force: :cascade do |t|
  end

  create_table "natal_charts", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_natal_charts_on_user_id"
  end

  create_table "natal_placements", force: :cascade do |t|
    t.bigint "natal_chart_id", null: false
    t.bigint "celestial_sign_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["celestial_sign_id"], name: "index_natal_placements_on_celestial_sign_id"
    t.index ["natal_chart_id"], name: "index_natal_placements_on_natal_chart_id"
  end

  create_table "signs", force: :cascade do |t|
    t.string "name"
    t.integer "modality"
    t.integer "element"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "ruling_celestial_id"
    t.index ["ruling_celestial_id"], name: "index_signs_on_ruling_celestial_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username", null: false
    t.string "first_name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "celestial_signs", "celestials"
  add_foreign_key "celestial_signs", "signs"
  add_foreign_key "natal_charts", "users"
  add_foreign_key "natal_placements", "celestial_signs"
  add_foreign_key "natal_placements", "natal_charts"
  add_foreign_key "signs", "celestials", column: "ruling_celestial_id"
end
