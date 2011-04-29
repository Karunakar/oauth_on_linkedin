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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20110420195743) do

  create_table "positions", :force => true do |t|
    t.string   "job_tile"
    t.integer  "profile_id"
    t.string   "company"
    t.string   "location"
    t.date     "start_date"
    t.date     "end_date"
    t.text     "description"
    t.string   "sort_key"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "profiles", :force => true do |t|
    t.string   "member_id"
    t.string   "location"
    t.string   "fb_uid"
    t.string   "head"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
  end

end
