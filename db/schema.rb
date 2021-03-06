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

ActiveRecord::Schema.define(version: 20170116140350) do

  create_table "coments", force: :cascade do |t|
    t.text     "content"
    t.integer  "user_id"
    t.integer  "news_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["news_id", "created_at"], name: "index_coments_on_news_id_and_created_at"
    t.index ["news_id"], name: "index_coments_on_news_id"
    t.index ["user_id"], name: "index_coments_on_user_id"
  end

  create_table "news", force: :cascade do |t|
    t.text     "content"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text     "title"
    t.index ["user_id", "created_at"], name: "index_news_on_user_id_and_created_at"
    t.index ["user_id"], name: "index_news_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "string"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "password_digest"
    t.boolean  "admin"
  end

end
