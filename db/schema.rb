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

ActiveRecord::Schema.define(version: 2022_02_01_022048) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "ski_resorts", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.integer "lifts"
    t.boolean "backcountry_access"
    t.integer "employee"
    t.boolean "snowboarder_permitted"
    t.integer "altitude"
    t.integer "avg_snowfall"
    t.string "location"
  end

  create_table "ski_runs", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.integer "distance"
    t.boolean "open"
    t.boolean "green"
    t.boolean "blue"
    t.boolean "black"
    t.string "condition"
    t.bigint "ski_resort_id"
    t.index ["ski_resort_id"], name: "index_ski_runs_on_ski_resort_id"
  end

  add_foreign_key "ski_runs", "ski_resorts"
end
