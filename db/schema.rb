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

ActiveRecord::Schema.define(version: 20170305052811) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "collections", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "movie_id"
    t.string   "movie_title"
    t.string   "movie_poster"
    t.string   "movie_year"
    t.string   "movie_plot"
    t.string   "movie_runtime"
    t.string   "movie_genre"
    t.string   "movie_metascore"
    t.string   "movie_imdbRating"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["user_id"], name: "index_collections_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "provider"
    t.string   "provider_id"
    t.string   "provider_hash"
    t.string   "email"
    t.string   "name"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_foreign_key "collections", "users"
end
