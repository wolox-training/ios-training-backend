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

ActiveRecord::Schema.define(version: 2021_03_18_040857) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "Book", id: :bigint, default: nil, force: :cascade do |t|
    t.text "author", null: false
    t.text "title", null: false
    t.text "image"
    t.text "year", null: false
    t.text "genre", null: false
    t.text "status"
  end

  create_table "Comment", id: :bigint, default: nil, force: :cascade do |t|
    t.text "content", null: false
    t.bigint "userID", null: false
    t.bigint "bookID", null: false
  end

  create_table "Rent", id: :bigint, default: nil, force: :cascade do |t|
    t.bigint "userID", null: false
    t.bigint "bookID", null: false
    t.datetime "from", null: false
    t.datetime "to", null: false
    t.datetime "returnedAt"
  end

  create_table "Suggestion", id: :bigint, default: nil, force: :cascade do |t|
    t.text "title", null: false
    t.text "author", null: false
    t.text "link", null: false
    t.bigint "userID", null: false
  end

  create_table "User", id: :bigint, default: nil, force: :cascade do |t|
    t.text "username", null: false
    t.text "password", null: false
    t.text "image"
  end

  create_table "Wish", id: :bigint, default: nil, force: :cascade do |t|
    t.bigint "userID", null: false
    t.bigint "bookID", null: false
  end

  create_table "book_suggestions", force: :cascade do |t|
    t.integer "book_id", null: false
    t.string "image"
    t.string "title"
    t.string "author"
    t.string "year"
    t.string "status"
    t.string "genre"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["book_id"], name: "index_book_suggestions_on_book_id"
  end

  create_table "books", force: :cascade do |t|
    t.string "image"
    t.string "title"
    t.string "author"
    t.string "year"
    t.string "status"
    t.string "genre"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "comments", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "book_id", null: false
    t.string "content"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["book_id"], name: "index_comments_on_book_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "fluent", id: :uuid, default: nil, force: :cascade do |t|
    t.text "name", null: false
    t.bigint "batch", null: false
    t.datetime "createdAt"
    t.datetime "updatedAt"
  end

  create_table "rents", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "book_id", null: false
    t.date "to"
    t.date "from"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["book_id"], name: "index_rents_on_book_id"
    t.index ["user_id"], name: "index_rents_on_user_id"
  end

  create_table "suggestions", force: :cascade do |t|
    t.integer "user_id", null: false
    t.string "link"
    t.string "title"
    t.string "author"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_suggestions_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password"
    t.string "image"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "wishes", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "book_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["book_id"], name: "index_wishes_on_book_id"
    t.index ["user_id"], name: "index_wishes_on_user_id"
  end

  add_foreign_key "book_suggestions", "books"
  add_foreign_key "comments", "books"
  add_foreign_key "comments", "users"
  add_foreign_key "rents", "books"
  add_foreign_key "rents", "users"
  add_foreign_key "suggestions", "users"
  add_foreign_key "wishes", "books"
  add_foreign_key "wishes", "users"
end
