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

ActiveRecord::Schema.define(version: 2021_07_29_063705) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "books", force: :cascade do |t|
    t.string "name", limit: 70, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name"], name: "index_books_on_name", unique: true
  end

  create_table "books_spells", id: false, force: :cascade do |t|
    t.bigint "spell_id", null: false
    t.bigint "book_id", null: false
    t.index ["book_id", "spell_id"], name: "index_books_spells_on_book_id_and_spell_id", unique: true
  end

  create_table "role_classes", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "role_classes_spells", id: false, force: :cascade do |t|
    t.bigint "role_class_id", null: false
    t.bigint "spell_id", null: false
    t.index ["spell_id", "role_class_id"], name: "index_role_classes_spells_on_spell_id_and_role_class_id", unique: true
  end

  create_table "schools", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "spells", force: :cascade do |t|
    t.string "name", limit: 70, null: false
    t.string "description", limit: 4096
    t.integer "level", null: false
    t.string "concentration", null: false
    t.bigint "school_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name"], name: "index_spells_on_name", unique: true
    t.index ["school_id"], name: "index_spells_on_school_id"
  end

  add_foreign_key "books_spells", "books"
  add_foreign_key "books_spells", "spells"
  add_foreign_key "role_classes_spells", "role_classes"
  add_foreign_key "role_classes_spells", "spells"
  add_foreign_key "spells", "schools"
end
