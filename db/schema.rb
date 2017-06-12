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

ActiveRecord::Schema.define(version: 20170611232131) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "capacities", force: :cascade do |t|
    t.string   "kind"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cards", force: :cascade do |t|
    t.integer  "attack"
    t.integer  "defense"
    t.integer  "category_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "capacity_id"
    t.index ["capacity_id"], name: "index_cards_on_capacity_id", using: :btree
    t.index ["category_id"], name: "index_cards_on_category_id", using: :btree
  end

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "decks", force: :cascade do |t|
    t.integer  "card_id"
    t.integer  "gamer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["card_id"], name: "index_decks_on_card_id", using: :btree
    t.index ["gamer_id"], name: "index_decks_on_gamer_id", using: :btree
  end

  create_table "game_histories", force: :cascade do |t|
    t.integer  "winner_id"
    t.integer  "loser_id"
    t.integer  "winner_card_id"
    t.integer  "loser_card_id"
    t.string   "description"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["loser_card_id"], name: "index_game_histories_on_loser_card_id", using: :btree
    t.index ["loser_id"], name: "index_game_histories_on_loser_id", using: :btree
    t.index ["winner_card_id"], name: "index_game_histories_on_winner_card_id", using: :btree
    t.index ["winner_id"], name: "index_game_histories_on_winner_id", using: :btree
  end

  create_table "gamers", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "decks", "cards"
  add_foreign_key "decks", "gamers"
end
