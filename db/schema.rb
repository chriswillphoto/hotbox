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

ActiveRecord::Schema.define(version: 20171130040220) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "collections", force: :cascade do |t|
    t.text "name"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "collections_toasters", id: false, force: :cascade do |t|
    t.integer "collection_id"
    t.integer "toaster_id"
  end

  create_table "comments", force: :cascade do |t|
    t.text "title"
    t.text "body"
    t.integer "user_id"
    t.integer "toaster_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "rating"
  end

  create_table "customs", force: :cascade do |t|
    t.text "name"
    t.text "image"
    t.text "user_id"
    t.text "toaster_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "description"
  end

  create_table "customs_favourites", id: false, force: :cascade do |t|
    t.integer "favourite_id"
    t.integer "custom_id"
  end

  create_table "favourites", force: :cascade do |t|
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "name"
  end

  create_table "toasters", force: :cascade do |t|
    t.text "model"
    t.text "manufacturer"
    t.integer "year"
    t.float "rating", default: 0.0
    t.integer "ratings", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.text "image"
    t.float "score", default: 0.0
    t.text "description"
  end

  create_table "upvotes", force: :cascade do |t|
    t.integer "user_id"
    t.integer "custom_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.text "name"
    t.text "username"
    t.text "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "admin", default: false
    t.text "image"
  end

  create_table "wallposts", force: :cascade do |t|
    t.text "message"
    t.integer "user_id"
    t.integer "custom_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
