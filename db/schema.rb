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

ActiveRecord::Schema.define(:version => 20111222042210) do

  create_table "microtasks", :force => true do |t|
    t.text     "original"
    t.text     "translate"
    t.integer  "price"
    t.boolean  "hit"
    t.integer  "task_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "lang_from"
    t.string   "lang_to"
  end

  add_index "microtasks", ["task_id"], :name => "index_microtasks_on_task_id"

  create_table "requesters", :force => true do |t|
    t.string   "email",                                 :default => "", :null => false
    t.string   "encrypted_password",     :limit => 128, :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                         :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "credits"
    t.string   "username"
  end

  add_index "requesters", ["email"], :name => "index_requesters_on_email", :unique => true
  add_index "requesters", ["reset_password_token"], :name => "index_requesters_on_reset_password_token", :unique => true

  create_table "tasks", :force => true do |t|
    t.integer  "requester_id"
    t.text     "content"
    t.string   "lang_from"
    t.string   "lang_to"
    t.integer  "budget"
    t.integer  "rating"
    t.integer  "status"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "title"
  end

  add_index "tasks", ["requester_id"], :name => "index_tasks_on_requester_id"

  create_table "workers", :force => true do |t|
    t.string   "email",                                 :default => "", :null => false
    t.string   "encrypted_password",     :limit => 128, :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                         :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "earning"
    t.integer  "rating"
    t.string   "username"
  end

  add_index "workers", ["email"], :name => "index_workers_on_email", :unique => true
  add_index "workers", ["reset_password_token"], :name => "index_workers_on_reset_password_token", :unique => true

end
