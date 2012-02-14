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

ActiveRecord::Schema.define(:version => 20120214072227) do

  create_table "activities", :force => true do |t|
    t.string   "title"
    t.string   "schedule"
    t.string   "place"
    t.string   "address"
    t.string   "telphone"
    t.string   "office_time"
    t.string   "bus_info"
    t.string   "poster_file_name"
    t.string   "poster_content_type"
    t.integer  "poster_file_size"
    t.datetime "poster_updated_at"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "albums", :force => true do |t|
    t.string   "title"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "articles", :force => true do |t|
    t.integer  "user_id"
    t.string   "title"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "articles", ["user_id"], :name => "index_articles_on_user_id"

  create_table "brands", :force => true do |t|
    t.string   "title"
    t.integer  "nation"
    t.string   "letter"
    t.integer  "category_id"
    t.string   "poster_file_name"
    t.string   "poster_content_type"
    t.integer  "poster_file_size"
    t.datetime "poster_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ckeditor_assets", :force => true do |t|
    t.string   "data_file_name",                  :null => false
    t.string   "data_content_type"
    t.integer  "data_file_size"
    t.integer  "assetable_id"
    t.string   "assetable_type",    :limit => 30
    t.string   "type",              :limit => 30
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "ckeditor_assets", ["assetable_type", "assetable_id"], :name => "idx_ckeditor_assetable"
  add_index "ckeditor_assets", ["assetable_type", "type", "assetable_id"], :name => "idx_ckeditor_assetable_type"

  create_table "comments", :force => true do |t|
    t.integer  "klass_id"
    t.integer  "klass_type"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "companies", :force => true do |t|
    t.string   "title"
    t.string   "other_title"
    t.string   "address"
    t.string   "telphone"
    t.string   "office_time"
    t.string   "bus_info"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "feeds", :force => true do |t|
    t.integer  "user_id"
    t.integer  "klass_id"
    t.string   "klass_type"
    t.string   "target_url"
    t.string   "title"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "feeds", ["user_id"], :name => "index_feeds_on_user_id"

  create_table "goods", :force => true do |t|
    t.string   "title"
    t.decimal  "price",               :precision => 8, :scale => 2, :default => 0.0
    t.integer  "brand_id"
    t.integer  "likes_count"
    t.string   "poster_file_name"
    t.string   "poster_content_type"
    t.integer  "poster_file_size"
    t.datetime "poster_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "likes", :force => true do |t|
    t.integer  "good_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "photos", :force => true do |t|
    t.integer  "klass_id"
    t.string   "klass_type"
    t.string   "file_file_name"
    t.string   "file_content_type"
    t.integer  "file_file_size"
    t.datetime "file_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "email"
    t.string   "name"
    t.string   "salt"
    t.string   "encrypted_password"
    t.string   "signcode"
    t.string   "verifycode"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["signcode"], :name => "index_users_on_signcode", :unique => true

  create_table "videos", :force => true do |t|
    t.string   "title"
    t.text     "content"
    t.text     "code"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
