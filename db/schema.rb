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

ActiveRecord::Schema.define(version: 20161005060314) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cities", force: :cascade do |t|
    t.string   "name",       null: false
    t.string   "country",    null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "teleporters", force: :cascade do |t|
    t.integer  "schedule_id", null: false
    t.integer  "user_id",     null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "teleporters_schedules", force: :cascade do |t|
    t.integer  "departure_id", null: false
    t.integer  "arrival_id",   null: false
    t.date     "date",         null: false
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "teleporters", "teleporters_schedules", column: "schedule_id", on_update: :cascade, on_delete: :cascade
  add_foreign_key "teleporters", "users", on_update: :cascade, on_delete: :cascade
  add_foreign_key "teleporters_schedules", "cities", column: "arrival_id", on_update: :cascade, on_delete: :cascade
  add_foreign_key "teleporters_schedules", "cities", column: "departure_id", on_update: :cascade, on_delete: :cascade
end
