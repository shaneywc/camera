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

ActiveRecord::Schema.define(:version => 20120104185547) do

  create_table "carts", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "line_items", :force => true do |t|
    t.integer  "product_id"
    t.integer  "cart_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "quantity",    :default => 1
    t.integer  "order_id"
    t.float    "price"
    t.float    "total_price"
  end

  create_table "orders", :force => true do |t|
    t.integer  "user_id"
    t.integer  "cart_id"
    t.integer  "product_id"
    t.float    "total_price"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "fullname"
    t.string   "email"
    t.text     "address"
    t.string   "pay_type"
  end

  create_table "products", :force => true do |t|
    t.string   "name"
    t.string   "make"
    t.text     "description"
    t.float    "price"
    t.string   "image"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.string   "category"
    t.float    "delivery_cost"
  end

  create_table "sessions", :force => true do |t|
    t.string   "session_id", :null => false
    t.text     "data"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sessions", ["session_id"], :name => "index_sessions_on_session_id"
  add_index "sessions", ["updated_at"], :name => "index_sessions_on_updated_at"

  create_table "users", :force => true do |t|
    t.string   "username"
    t.string   "hashed_password"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "salt"
    t.boolean  "admin",           :default => false
    t.string   "fullname"
    t.string   "email"
    t.integer  "phone"
    t.text     "address"
  end

  add_index "users", ["username"], :name => "index_users_on_username", :unique => true

end
