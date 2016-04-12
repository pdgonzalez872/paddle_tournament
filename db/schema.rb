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

ActiveRecord::Schema.define(version: 20160218032609) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "draw_positions", force: :cascade do |t|
    t.integer  "match_id"
    t.integer  "draw_id"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.integer  "draw_positions_number"
  end

  create_table "draw_positions_players", force: :cascade do |t|
    t.integer  "draw_position_id"
    t.integer  "player_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "draws", force: :cascade do |t|
    t.string   "name"
    t.integer  "size"
    t.integer  "tournament_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "locations", force: :cascade do |t|
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.string   "name"
    t.string   "address"
    t.string   "short_letters"
  end

  create_table "matches", force: :cascade do |t|
    t.integer  "draw_id"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.integer  "location_id"
    t.datetime "time"
    t.integer  "match_number"
    t.string   "name"
    t.integer  "winner_id"
    t.integer  "loser_id"
    t.string   "score"
    t.string   "previous_match_score"
  end

  create_table "players", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "phone_number"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.integer  "current_draw_position"
    t.integer  "draw_position_id"
  end

  create_table "static_pages", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tournaments", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
