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

ActiveRecord::Schema.define(:version => 20120515004923) do

  create_table "articles", :force => true do |t|
    t.integer  "product_id"
    t.text     "description",                :null => false
    t.string   "size",                       :null => false
    t.integer  "in_stock",    :default => 0
    t.string   "code",                       :null => false
    t.integer  "status"
    t.integer  "price",                      :null => false
    t.datetime "created_at",                 :null => false
    t.datetime "updated_at",                 :null => false
  end

  add_index "articles", ["code"], :name => "index_articles_on_code", :unique => true
  add_index "articles", ["description"], :name => "index_articles_on_description", :length => {"description"=>100}
  add_index "articles", ["size"], :name => "index_articles_on_size"

  create_table "items", :force => true do |t|
    t.integer  "product_id",                 :null => false
    t.text     "description"
    t.string   "size",                       :null => false
    t.integer  "in_stock",    :default => 0, :null => false
    t.string   "code",                       :null => false
    t.datetime "created_at",                 :null => false
    t.datetime "updated_at",                 :null => false
  end

  add_index "items", ["code"], :name => "index_items_on_code", :unique => true
  add_index "items", ["product_id", "size"], :name => "index_items_on_product_id_and_size"

  create_table "products", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "products", ["name"], :name => "index_products_on_name", :unique => true

  create_table "sale_transactions", :force => true do |t|
    t.integer  "sale_id"
    t.integer  "article_id"
    t.integer  "quantity_articles"
    t.integer  "status"
    t.float    "article_unit_price_sold"
    t.float    "article_total_price"
    t.datetime "created_at",              :null => false
    t.datetime "updated_at",              :null => false
  end

  create_table "sales", :force => true do |t|
    t.string   "salesman",   :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "sales", ["salesman"], :name => "index_sales_on_salesman"

  create_table "users", :force => true do |t|
    t.string   "email",               :default => "",    :null => false
    t.string   "encrypted_password",  :default => "",    :null => false
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",       :default => 0
    t.string   "fullname",                               :null => false
    t.string   "username",                               :null => false
    t.boolean  "is_admin",            :default => false
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  add_index "users", ["fullname", "username", "email"], :name => "index_users_on_fullname_and_username_and_email", :unique => true

end
