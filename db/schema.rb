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

ActiveRecord::Schema.define(:version => 20130228035223) do

  create_table "badges", :force => true do |t|
    t.string   "slug",        :limit => 50,                 :null => false
    t.datetime "created_at",                                :null => false
    t.datetime "updated_at",                                :null => false
    t.integer  "qr_code_id"
    t.string   "title",       :limit => 100,                :null => false
    t.string   "description",                               :null => false
    t.integer  "rank",                       :default => 0, :null => false
  end

  add_index "badges", ["qr_code_id"], :name => "index_badges_on_qr_code_id"
  add_index "badges", ["slug"], :name => "index_badges_on_slug"

  create_table "qr_codes", :force => true do |t|
    t.string   "shortcode",  :limit => 6,                    :null => false
    t.datetime "created_at",                                 :null => false
    t.datetime "updated_at",                                 :null => false
    t.boolean  "is_member",               :default => false, :null => false
  end

  create_table "sessions", :force => true do |t|
    t.string   "session_id", :null => false
    t.text     "data"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "sessions", ["session_id"], :name => "index_sessions_on_session_id"
  add_index "sessions", ["updated_at"], :name => "index_sessions_on_updated_at"

  create_table "users", :primary_key => "fbid", :force => true do |t|
    t.string   "username",                               :null => false
    t.boolean  "use_profile_pic",      :default => true, :null => false
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.datetime "last_qrcode_found_at"
  end

  create_table "users_badges", :id => false, :force => true do |t|
    t.integer "user_id",  :null => false
    t.integer "badge_id", :null => false
  end

  add_index "users_badges", ["user_id"], :name => "index_users_badges_on_user_id"

  create_table "users_qr_codes", :id => false, :force => true do |t|
    t.integer "user_id",    :null => false
    t.integer "qr_code_id", :null => false
  end

  add_index "users_qr_codes", ["user_id"], :name => "index_users_qr_codes_on_user_id"

end
