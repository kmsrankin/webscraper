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

ActiveRecord::Schema.define(version: 2019_04_28_142314) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "contributions", force: :cascade do |t|
    t.bigint "contributor_id"
    t.bigint "repository_id"
    t.index ["contributor_id"], name: "index_contributions_on_contributor_id"
    t.index ["repository_id"], name: "index_contributions_on_repository_id"
  end

  create_table "contributors", force: :cascade do |t|
    t.string "name"
  end

  create_table "repositories", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.string "language"
  end

end
