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

ActiveRecord::Schema.define(:version => 20121220070839) do

  create_table "blogs", :force => true do |t|
    t.integer  "user_id"
    t.string   "title"
    t.date     "posting_date"
    t.string   "location"
    t.text     "content"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  add_index "blogs", ["user_id", "created_at"], :name => "index_blogs_on_user_id_and_created_at"

  create_table "notes", :force => true do |t|
    t.string   "title",      :null => false
    t.string   "content",    :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "username"
    t.string   "password_digest"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.string   "token"
  end

  add_index "users", ["token"], :name => "index_users_on_token"

end
