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

ActiveRecord::Schema.define(version: 20170823013702) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", force: :cascade do |t|
    t.string   "username",        null: false
    t.string   "email",           null: false
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "game_aways", force: :cascade do |t|
    t.integer  "team_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["team_id"], name: "index_game_aways_on_team_id", using: :btree
  end

  create_table "game_homes", force: :cascade do |t|
    t.integer  "team_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["team_id"], name: "index_game_homes_on_team_id", using: :btree
  end

  create_table "games", force: :cascade do |t|
    t.integer  "away_score"
    t.integer  "home_score"
    t.boolean  "away_winner?"
    t.boolean  "home_winner?"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "game_away_id"
    t.integer  "game_home_id"
    t.integer  "match_id"
    t.index ["game_away_id"], name: "index_games_on_game_away_id", using: :btree
    t.index ["game_home_id"], name: "index_games_on_game_home_id", using: :btree
    t.index ["match_id"], name: "index_games_on_match_id", using: :btree
  end

  create_table "matches", force: :cascade do |t|
    t.integer  "winner"
    t.integer  "loser"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "teams", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "team_id"
    t.index ["team_id"], name: "index_users_on_team_id", using: :btree
  end

end
