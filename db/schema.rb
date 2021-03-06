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

ActiveRecord::Schema.define(version: 20171203174834) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "coefficient_tables", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "coefficient_time_ranges", force: :cascade do |t|
    t.bigint "coefficient_table_id"
    t.bigint "rule_id"
    t.daterange "timeRange"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["coefficient_table_id"], name: "index_coefficient_time_ranges_on_coefficient_table_id"
    t.index ["rule_id"], name: "index_coefficient_time_ranges_on_rule_id"
  end

  create_table "games", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "rules", force: :cascade do |t|
    t.bigint "game_id"
    t.json "geo"
    t.json "devices"
    t.json "channels"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["game_id"], name: "index_rules_on_game_id"
  end

  add_foreign_key "coefficient_time_ranges", "coefficient_tables"
  add_foreign_key "coefficient_time_ranges", "rules"
  add_foreign_key "rules", "games"
end
