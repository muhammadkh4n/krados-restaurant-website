# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20161029114116) do

  create_table "admins", force: :cascade do |t|
    t.string   "username"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "branches", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "dishes", force: :cascade do |t|
    t.string   "name"
    t.integer  "price"
    t.text     "description"
    t.string   "image"
    t.boolean  "special",     default: false
    t.integer  "category_id"
    t.integer  "branch_id"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  add_index "dishes", ["branch_id"], name: "index_dishes_on_branch_id"
  add_index "dishes", ["category_id"], name: "index_dishes_on_category_id"

  create_table "pages", force: :cascade do |t|
    t.string   "title"
    t.text     "text"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.text     "images",     default: "--- []\n"
  end

  create_table "pointless_feedback_messages", force: :cascade do |t|
    t.string   "name"
    t.string   "email_address"
    t.string   "topic"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
