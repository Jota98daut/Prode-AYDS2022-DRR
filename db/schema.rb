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
  end

  create_table "champion_bets", force: :cascade do |t|
  end

  create_table "countries", force: :cascade do |t|
    t.string "name"
  end

  create_table "matches", force: :cascade do |t|
    t.date "date"
    t.time "time"
    t.boolean "draw"
  end

  create_table "players", force: :cascade do |t|
  end

  create_table "sports", force: :cascade do |t|
    t.string "name"
  end

  create_table "stages", force: :cascade do |t|
    t.string "name"
    t.boolean "penalties"
  end

  create_table "teams", force: :cascade do |t|
    t.string "name"
  end

  create_table "tournaments", force: :cascade do |t|
    t.string "name"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password"
  end

end
