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

ActiveRecord::Schema.define(version: 20141110001902) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "hangman_games", force: true do |t|
    t.integer  "user_id"
    t.string   "word"
    t.string   "game_state"
    t.integer  "bad_guesses"
    t.boolean  "end_game"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tic_tac_toe_games", force: true do |t|
    t.integer  "user_id"
    t.string   "x_moves"
    t.string   "o_moves"
    t.string   "game_state"
    t.boolean  "end_game"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "username",      null: false
    t.string   "password_hash", null: false
    t.string   "wins"
    t.string   "losses"
    t.text     "aboutme"
    t.string   "avatar"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "words", force: true do |t|
    t.string "body"
  end

end
