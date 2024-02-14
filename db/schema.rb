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

ActiveRecord::Schema[7.1].define(version: 2024_02_14_205215) do
  create_table "analytics", force: :cascade do |t|
    t.string "system_name"
    t.string "browser_name"
    t.string "browser_version"
    t.string "referer"
    t.string "ip"
    t.string "device"
    t.string "city"
    t.string "country"
    t.string "region"
    t.string "latitude"
    t.string "longitude"
    t.integer "link_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["link_id"], name: "index_analytics_on_link_id"
  end

  create_table "links", force: :cascade do |t|
    t.string "original_url"
    t.string "token"
    t.integer "analytics_count", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["token"], name: "index_links_on_token", unique: true
  end

  add_foreign_key "analytics", "links"
end
