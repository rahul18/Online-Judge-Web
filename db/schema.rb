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

ActiveRecord::Schema.define(:version => 20120328143146) do

  create_table "programming_languages", :force => true do |t|
    t.string   "name"
    t.boolean  "available"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "programming_languages", ["name"], :name => "index_programming_languages_on_name", :unique => true

  create_table "programming_languages_programming_tasks", :id => false, :force => true do |t|
    t.integer "programming_task_id"
    t.integer "programming_language_id"
  end

  add_index "programming_languages_programming_tasks", ["programming_language_id", "programming_task_id"], :name => "index_plpt_on_langs_and_tasks", :unique => true

  create_table "programming_tasks", :force => true do |t|
    t.text     "statement"
    t.text     "input_format"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.integer  "time_limit"
    t.integer  "memory_limit"
    t.string   "name"
  end

  create_table "programming_test_cases", :force => true do |t|
    t.integer  "programming_task_id"
    t.text     "stdin"
    t.text     "stdout"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
  end

  create_table "programs", :force => true do |t|
    t.integer  "programming_task_id"
    t.integer  "user_id"
    t.text     "source_code"
    t.integer  "programming_language_id"
    t.integer  "status_code_id"
    t.datetime "created_at",              :null => false
    t.datetime "updated_at",              :null => false
    t.integer  "memory"
    t.integer  "time"
  end

  create_table "status_codes", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.string   "password_digest"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["name"], :name => "index_users_on_name", :unique => true

end
