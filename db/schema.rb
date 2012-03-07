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

ActiveRecord::Schema.define(:version => 20120306144217) do

  create_table "activities", :force => true do |t|
    t.integer  "user_id"
    t.integer  "activity_type",       :default => 0
    t.string   "activity_category"
    t.string   "activity_area"
    t.string   "title"
    t.string   "schedule"
    t.string   "place"
    t.string   "address"
    t.string   "telphone"
    t.string   "office_time"
    t.string   "bus_info"
    t.string   "discount"
    t.string   "website"
    t.string   "poster_file_name"
    t.string   "poster_content_type"
    t.integer  "poster_file_size"
    t.datetime "poster_updated_at"
    t.integer  "comments_count",      :default => 0
    t.text     "content"
    t.integer  "resource_type",       :default => 1
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "activity_areas", :force => true do |t|
    t.string   "name"
    t.integer  "position",   :default => 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "activity_categories", :force => true do |t|
    t.string   "name"
    t.integer  "position",   :default => 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "areas", :force => true do |t|
    t.string   "name"
    t.integer  "position"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "articles", :force => true do |t|
    t.integer  "user_id"
    t.string   "title"
    t.string   "other_title"
    t.text     "summary"
    t.text     "content"
    t.string   "code"
    t.string   "poster_file_name"
    t.string   "poster_content_type"
    t.integer  "poster_file_size"
    t.datetime "poster_updated_at"
    t.integer  "likes_count",                                       :default => 0
    t.integer  "shares_count",                                      :default => 0
    t.integer  "collections_count",                                 :default => 0
    t.integer  "state",                                             :default => 1
    t.integer  "comments_count",                                    :default => 0
    t.integer  "source_type",                                       :default => 0
    t.boolean  "is_article",                                        :default => true
    t.boolean  "is_photo",                                          :default => false
    t.boolean  "is_video",                                          :default => false
    t.boolean  "is_news",                                           :default => false
    t.boolean  "is_activity",                                       :default => false
    t.boolean  "is_company",                                        :default => false
    t.boolean  "is_brand",                                          :default => false
    t.boolean  "is_good",                                           :default => false
    t.boolean  "is_groupbuy",                                       :default => false
    t.string   "schedule"
    t.string   "place"
    t.string   "address"
    t.string   "telphone"
    t.string   "office_time"
    t.string   "bus_info"
    t.string   "discount"
    t.string   "website"
    t.string   "brand_name"
    t.string   "brand_desc"
    t.string   "category"
    t.string   "area"
    t.string   "province"
    t.string   "city"
    t.string   "map"
    t.decimal  "price",               :precision => 8, :scale => 2, :default => 0.0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "articles", ["user_id"], :name => "index_articles_on_user_id"

  create_table "categories", :force => true do |t|
    t.string   "name"
    t.integer  "position"
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
    t.integer  "user_id"
    t.integer  "klass_id"
    t.integer  "klass_type"
    t.text     "content"
    t.integer  "resource_type", :default => 1
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "companies", :force => true do |t|
    t.integer  "company_type",     :default => 0
    t.string   "company_category"
    t.string   "company_area"
    t.string   "title"
    t.string   "other_title"
    t.string   "address"
    t.string   "telphone"
    t.string   "office_time"
    t.string   "bus_info"
    t.string   "website"
    t.integer  "comments_count",   :default => 0
    t.text     "content"
    t.integer  "resource_type",    :default => 1
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "company_areas", :force => true do |t|
    t.string   "name"
    t.integer  "position",   :default => 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "company_categories", :force => true do |t|
    t.string   "name"
    t.integer  "position",   :default => 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "feeds", :force => true do |t|
    t.integer  "user_id"
    t.integer  "klass_id"
    t.string   "klass_type"
    t.string   "target_url"
    t.string   "template_type"
    t.string   "title"
    t.text     "content"
    t.string   "code"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "feeds", ["user_id"], :name => "index_feeds_on_user_id"

  create_table "goods", :force => true do |t|
    t.integer  "user_id"
    t.string   "title"
    t.decimal  "price",               :precision => 8, :scale => 2, :default => 0.0
    t.integer  "brand_id"
    t.integer  "likes_count",                                       :default => 0
    t.integer  "comments_count",                                    :default => 0
    t.text     "content"
    t.string   "poster_file_name"
    t.string   "poster_content_type"
    t.integer  "poster_file_size"
    t.datetime "poster_updated_at"
    t.integer  "resource_type",                                     :default => 1
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "likes", :force => true do |t|
    t.integer  "user_id"
    t.integer  "article_id"
    t.integer  "like_type",  :default => 0
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

  create_table "taggings", :force => true do |t|
    t.integer  "tag_id"
    t.integer  "taggable_id"
    t.string   "taggable_type"
    t.integer  "tagger_id"
    t.string   "tagger_type"
    t.string   "context",       :limit => 128
    t.datetime "created_at"
  end

  add_index "taggings", ["tag_id"], :name => "index_taggings_on_tag_id"
  add_index "taggings", ["taggable_id", "taggable_type", "context"], :name => "index_taggings_on_taggable_id_and_taggable_type_and_context"

  create_table "tags", :force => true do |t|
    t.string "name"
  end

  create_table "users", :force => true do |t|
    t.string   "email"
    t.string   "name"
    t.string   "salt"
    t.string   "encrypted_password"
    t.string   "signcode"
    t.string   "verifycode"
    t.integer  "articles_count",      :default => 0
    t.integer  "followers_count",     :default => 0
    t.integer  "followings_count",    :default => 0
    t.integer  "favorites_count",     :default => 0
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.integer  "promotion",           :default => 10
    t.boolean  "deleted",             :default => false
    t.integer  "role",                :default => 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["signcode"], :name => "index_users_on_signcode", :unique => true

  create_table "visits", :force => true do |t|
    t.integer  "klass_id"
    t.string   "klass_type"
    t.integer  "user_id"
    t.string   "user_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
