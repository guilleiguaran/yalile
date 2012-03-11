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

ActiveRecord::Schema.define(:version => 20120309044034) do

  create_table "users", :force => true do |t|
    t.string   "email",              :default => "",    :null => false
    t.string   "encrypted_password", :default => "",    :null => false
    t.integer  "sign_in_count",      :default => 0
    t.string   "full_name",                             :null => false
    t.string   "user_name",                             :null => false
    t.boolean  "is_admin",           :default => false
    t.datetime "created_at",                            :null => false
    t.datetime "updated_at",                            :null => false
  end

  add_index "users", ["full_name", "user_name", "email"], :name => "index_users_on_full_name_and_user_name_and_email", :unique => true

end
