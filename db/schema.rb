# encoding: UTF-8
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

ActiveRecord::Schema.define(:version => 20120413223853) do

  create_table "alliances", :force => true do |t|
    t.string   "name"
    t.integer  "corporation_count"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  create_table "corporations", :force => true do |t|
    t.string   "name"
    t.integer  "members"
    t.integer  "alliance_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.integer  "corp_id"
  end

  create_table "past_systems", :force => true do |t|
    t.string   "solar_system"
    t.string   "ship_type"
    t.integer  "target_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "target_alliances", :force => true do |t|
    t.string   "name"
    t.integer  "corporation_count"
    t.integer  "wardec_id"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  create_table "target_corporations", :force => true do |t|
    t.string   "name"
    t.string   "members"
    t.integer  "target_alliance_id"
    t.integer  "wardec_id"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

  create_table "targets", :force => true do |t|
    t.string   "name"
    t.string   "ship_type"
    t.text     "notes"
    t.integer  "target_corporation_id"
    t.datetime "created_at",            :null => false
    t.datetime "updated_at",            :null => false
  end

  create_table "users", :force => true do |t|
    t.integer  "char_id"
    t.string   "char_name"
    t.string   "corp_name"
    t.integer  "corp_id"
    t.string   "alliance_name"
    t.integer  "alliance_id"
    t.string   "ship_type"
    t.integer  "corporation_id"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "wardecs", :force => true do |t|
    t.string   "decname"
    t.text     "notes"
    t.datetime "end_date"
    t.integer  "alliance_id"
    t.integer  "corporation_id"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

end
