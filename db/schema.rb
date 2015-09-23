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

ActiveRecord::Schema.define(version: 20150921163255) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "conf_activities", force: :cascade do |t|
    t.integer  "attendee_id"
    t.integer  "event_id"
    t.datetime "happened_at"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "conf_attendees", force: :cascade do |t|
    t.integer  "identity",              default: 1
    t.string   "check_code",  limit: 4
    t.integer  "ticket_type"
    t.string   "name"
    t.string   "email"
    t.string   "org"
    t.string   "title"
    t.string   "github"
    t.string   "twitter"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
  end

  create_table "conf_events", force: :cascade do |t|
    t.string   "name"
    t.string   "category"
    t.string   "slug"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "resource_id"
    t.string   "resource_type"
    t.datetime "begins_at"
    t.datetime "ends_at"
    t.text     "description"
  end

  create_table "posts", force: :cascade do |t|
    t.string   "title"
    t.text     "content"
    t.date     "publish_date"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "speakers", force: :cascade do |t|
    t.string   "name"
    t.string   "avatar"
    t.string   "biography"
    t.string   "subject"
    t.text     "abstract"
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
    t.integer  "sort_order"
    t.string   "title"
    t.string   "dom_id",     limit: 32
    t.string   "twitter",    limit: 64
    t.string   "github",     limit: 64
    t.string   "home_page"
    t.boolean  "english",               default: true
    t.boolean  "lt_speaker"
    t.string   "slide_url"
    t.string   "video_url"
  end

  create_table "sponsors", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.string   "image"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "link"
    t.integer  "level"
    t.string   "twox_image"
  end

  create_table "staffs", force: :cascade do |t|
    t.string   "name"
    t.string   "link"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "password_digest"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree

end
