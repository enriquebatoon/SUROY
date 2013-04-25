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

ActiveRecord::Schema.define(:version => 20130320124107) do

  create_table "active_admin_comments", :force => true do |t|
    t.string   "resource_id",   :null => false
    t.string   "resource_type", :null => false
    t.integer  "author_id"
    t.string   "author_type"
    t.text     "body"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.string   "namespace"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], :name => "index_active_admin_comments_on_author_type_and_author_id"
  add_index "active_admin_comments", ["namespace"], :name => "index_active_admin_comments_on_namespace"
  add_index "active_admin_comments", ["resource_type", "resource_id"], :name => "index_admin_notes_on_resource_type_and_resource_id"

  create_table "admin_users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  add_index "admin_users", ["email"], :name => "index_admin_users_on_email", :unique => true
  add_index "admin_users", ["reset_password_token"], :name => "index_admin_users_on_reset_password_token", :unique => true

  create_table "companies", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.string   "address"
    t.integer  "member_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.integer  "approved"
  end

  create_table "company_hotspots", :id => false, :force => true do |t|
    t.integer "company_id"
    t.integer "hotspot_id"
  end

  add_index "company_hotspots", ["company_id"], :name => "index_company_hotspots_on_company_id"
  add_index "company_hotspots", ["hotspot_id"], :name => "index_company_hotspots_on_hotspot_id"

  create_table "hotspot_remarks", :id => false, :force => true do |t|
    t.integer "remarks_id"
    t.integer "hotspot_id"
  end

  add_index "hotspot_remarks", ["hotspot_id"], :name => "index_hotspot_remarks_on_hotspot_id"
  add_index "hotspot_remarks", ["remarks_id"], :name => "index_hotspot_remarks_on_remarks_id"

  create_table "hotspot_services", :id => false, :force => true do |t|
    t.integer "service_id"
    t.integer "hotspot_id"
  end

  add_index "hotspot_services", ["hotspot_id"], :name => "index_hotspot_services_on_hotspot_id"
  add_index "hotspot_services", ["service_id"], :name => "index_hotspot_services_on_service_id"

  create_table "hotspots", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.string   "location"
    t.integer  "company_id"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
  end

  create_table "member_companies", :id => false, :force => true do |t|
    t.integer "member_id"
    t.integer "company_id"
  end

  add_index "member_companies", ["company_id"], :name => "index_member_companies_on_company_id"
  add_index "member_companies", ["member_id"], :name => "index_member_companies_on_member_id"

  create_table "member_remarks", :id => false, :force => true do |t|
    t.integer "remarks_id"
    t.integer "member_id"
  end

  add_index "member_remarks", ["member_id"], :name => "index_member_remarks_on_member_id"
  add_index "member_remarks", ["remarks_id"], :name => "index_member_remarks_on_remarks_id"

  create_table "members", :force => true do |t|
    t.string   "username"
    t.string   "email"
    t.string   "firstname"
    t.string   "lastname"
    t.date     "dob"
    t.integer  "user_type"
    t.string   "password_hash"
    t.string   "password_salt"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
  end

  create_table "rates", :force => true do |t|
    t.integer  "rater_id"
    t.integer  "rateable_id"
    t.string   "rateable_type"
    t.integer  "stars",         :null => false
    t.string   "dimension"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "rates", ["rateable_id", "rateable_type"], :name => "index_rates_on_rateable_id_and_rateable_type"
  add_index "rates", ["rater_id"], :name => "index_rates_on_rater_id"

  create_table "ratings", :force => true do |t|
    t.integer  "rating"
    t.integer  "hotspot_id"
    t.integer  "member_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "remark", :force => true do |t|
    t.string   "remark"
    t.integer  "hotspot_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "remarks", :force => true do |t|
    t.string   "remark"
    t.integer  "hotspot_id"
    t.integer  "member_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "services", :force => true do |t|
    t.string   "name"
    t.integer  "rate"
    t.integer  "hotspot_id"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
  end

end
