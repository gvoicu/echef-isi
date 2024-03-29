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

ActiveRecord::Schema.define(:version => 20130106230754) do

  create_table "bookings", :force => true do |t|
    t.datetime "start"
    t.datetime "end"
    t.string   "name"
    t.string   "email"
    t.string   "phone"
    t.boolean  "confirmed"
    t.integer  "table_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "bookings", ["table_id"], :name => "index_bookings_on_table_id"

  create_table "complaints", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "phone"
    t.string   "body"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "dish_types", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "dishes", :force => true do |t|
    t.string   "ingredients"
    t.integer  "grams"
    t.float    "price"
    t.integer  "time"
    t.integer  "dish_type_id"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
    t.string   "name"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
  end

  add_index "dishes", ["dish_type_id"], :name => "index_dishes_on_dish_type_id"

  create_table "notifications", :force => true do |t|
    t.string   "note"
    t.integer  "table_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.boolean  "status"
  end

  add_index "notifications", ["table_id"], :name => "index_notifications_on_table_id"

  create_table "order_dishes", :force => true do |t|
    t.integer  "order_id"
    t.integer  "dish_id"
    t.integer  "time"
    t.string   "note"
    t.integer  "dish_status"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "order_dishes", ["dish_id"], :name => "index_order_dishes_on_dish_id"
  add_index "order_dishes", ["order_id"], :name => "index_order_dishes_on_order_id"

  create_table "orders", :force => true do |t|
    t.datetime "closed_at"
    t.integer  "rating"
    t.integer  "table_id"
    t.integer  "waiter_id"
    t.integer  "chef_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.integer  "order_status"
  end

  add_index "orders", ["chef_id"], :name => "index_orders_on_chef_id"
  add_index "orders", ["table_id"], :name => "index_orders_on_table_id"
  add_index "orders", ["waiter_id"], :name => "index_orders_on_waiter_id"

  create_table "tables", :force => true do |t|
    t.integer  "number"
    t.string   "qr_code"
    t.integer  "persons"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "username",               :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "name"
    t.string   "phone"
    t.integer  "u_type"
    t.string   "email"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true
  add_index "users", ["username"], :name => "index_users_on_username", :unique => true

end
