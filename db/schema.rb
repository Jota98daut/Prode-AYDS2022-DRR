# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2022_05_05_022139) do
  create_table "bets", force: :cascade do |t|
    t.boolean "draw"
    t.integer "player_id"
    t.integer "team_id"
    t.integer "match_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["match_id"], name: "index_bets_on_match_id"
    t.index ["player_id"], name: "index_bets_on_player_id"
    t.index ["team_id"], name: "index_bets_on_team_id"
  end

  create_table "champion_bets", force: :cascade do |t|
    t.integer "player_id"
    t.integer "team_id"
    t.integer "tournament_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["player_id"], name: "index_champion_bets_on_player_id"
    t.index ["team_id"], name: "index_champion_bets_on_team_id"
    t.index ["tournament_id"], name: "index_champion_bets_on_tournament_id"
  end

  create_table "countries", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "matches", force: :cascade do |t|
    t.date "date"
    t.time "time"
    t.boolean "draw"
    t.integer "home_id"
    t.integer "away_id"
    t.integer "winner_id"
    t.integer "stage_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["away_id"], name: "index_matches_on_away_id"
    t.index ["home_id"], name: "index_matches_on_home_id"
    t.index ["stage_id"], name: "index_matches_on_stage_id"
    t.index ["winner_id"], name: "index_matches_on_winner_id"
  end

  create_table "players", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sports", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "stages", force: :cascade do |t|
    t.string "name"
    t.boolean "penalties"
    t.integer "tournament_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["tournament_id"], name: "index_stages_on_tournament_id"
  end

  create_table "teams", force: :cascade do |t|
    t.string "name"
    t.integer "country_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["country_id"], name: "index_teams_on_country_id"
  end

  create_table "tournaments", force: :cascade do |t|
    t.string "name"
    t.integer "sport_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["sport_id"], name: "index_tournaments_on_sport_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "matches", "team", column: "away_id"
  add_foreign_key "matches", "team", column: "home_id"
  add_foreign_key "matches", "team", column: "winner_id"
end
