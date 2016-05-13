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

ActiveRecord::Schema.define(version: 0) do

  create_table "calendars", force: :cascade do |t|
    t.date    "date"
    t.integer "event_id"
    t.integer "community_id"
  end

  add_index "calendars", ["community_id"], name: "index_calendars_on_community_id"
  add_index "calendars", ["event_id"], name: "index_calendars_on_event_id"

  create_table "communities", force: :cascade do |t|
    t.integer "creator_id"
    t.text    "comm_category"
    t.text    "location"
  end

  add_index "communities", ["creator_id"], name: "index_communities_on_creator_id"

  create_table "events", force: :cascade do |t|
    t.text    "title"
    t.text    "location"
    t.text    "image_url"
    t.date    "date_start"
    t.date    "date_end"
    t.time    "time_start"
    t.time    "time_end"
    t.text    "description"
    t.integer "creator_id"
    t.integer "community_id"
    t.text    "event_category"
  end

  add_index "events", ["community_id"], name: "index_events_on_community_id"
  add_index "events", ["creator_id"], name: "index_events_on_creator_id"

  create_table "users", force: :cascade do |t|
    t.text "username"
    t.text "email"
    t.text "password"
  end

end
