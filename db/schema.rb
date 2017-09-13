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

ActiveRecord::Schema.define(version: 20170823132510) do

  create_table "colleges", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "departments", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "college_id"
    t.index ["college_id"], name: "index_departments_on_college_id"
  end

  create_table "presenters", force: :cascade do |t|
    t.string "name"
    t.string "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "presenters_workshops", id: false, force: :cascade do |t|
    t.integer "workshop_id", null: false
    t.integer "presenter_id", null: false
  end

  create_table "subscribers", force: :cascade do |t|
    t.string "title"
    t.string "name"
    t.string "position"
    t.string "email"
    t.integer "phone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "department_id"
    t.boolean "attend"
    t.index ["department_id"], name: "index_subscribers_on_department_id"
  end

  create_table "subscribers_workshops", id: false, force: :cascade do |t|
    t.integer "workshop_id", null: false
    t.integer "subscriber_id", null: false
  end

  create_table "workshops", force: :cascade do |t|
    t.string "title"
    t.date "date"
    t.string "goals"
    t.string "skills"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "current"
    t.boolean "upcoming"
  end

end
