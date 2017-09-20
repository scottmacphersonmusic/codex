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

ActiveRecord::Schema.define(version: 20170920022611) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "codex_songs", force: :cascade do |t|
    t.integer  "codex_id"
    t.integer  "song_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "codex_songs", ["codex_id"], name: "index_codex_songs_on_codex_id", using: :btree
  add_index "codex_songs", ["song_id"], name: "index_codex_songs_on_song_id", using: :btree

  create_table "codices", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "instruments", force: :cascade do |t|
    t.string   "name"
    t.string   "key",        default: "C"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "instruments_practice_sessions", force: :cascade do |t|
    t.integer  "instrument_id"
    t.integer  "practice_session_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  add_index "instruments_practice_sessions", ["instrument_id"], name: "index_instruments_practice_sessions_on_instrument_id", using: :btree
  add_index "instruments_practice_sessions", ["practice_session_id"], name: "index_instruments_practice_sessions_on_practice_session_id", using: :btree

  create_table "practice_session_songs", force: :cascade do |t|
    t.integer  "practice_session_id"
    t.integer  "practice_session_song_id"
    t.integer  "instrument_id"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  add_index "practice_session_songs", ["instrument_id"], name: "index_practice_session_songs_on_instrument_id", using: :btree
  add_index "practice_session_songs", ["practice_session_id"], name: "index_practice_session_songs_on_practice_session_id", using: :btree
  add_index "practice_session_songs", ["practice_session_song_id"], name: "index_practice_session_songs_on_practice_session_song_id", using: :btree

  create_table "practice_sessions", force: :cascade do |t|
    t.string   "notes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "songs", force: :cascade do |t|
    t.string   "title"
    t.string   "key",        default: "C"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

end
