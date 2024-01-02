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

ActiveRecord::Schema[7.1].define(version: 2024_01_02_023438) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "celestials", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "type", default: "Planet", null: false
  end

  create_table "celestials_signs", id: false, force: :cascade do |t|
    t.bigint "celestial_id", null: false
    t.bigint "sign_id", null: false
    t.integer "essential_dignity"
    t.index ["celestial_id", "sign_id"], name: "index_celestials_signs_on_celestial_id_and_sign_id"
    t.index ["sign_id", "celestial_id"], name: "index_celestials_signs_on_sign_id_and_celestial_id"
  end

  create_table "data_migrations", primary_key: "version", id: :string, force: :cascade do |t|
  end

  create_table "signs", force: :cascade do |t|
    t.string "name"
    t.integer "modality"
    t.integer "element"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
