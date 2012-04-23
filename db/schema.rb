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

ActiveRecord::Schema.define(:version => 20120422040146) do

  create_table "activities", :force => true do |t|
    t.integer  "user_id"
    t.integer  "archetype_id"
    t.string   "title"
    t.string   "summary"
    t.text     "content"
    t.string   "opening_date"
    t.integer  "status",              :default => 0
    t.boolean  "suggest",             :default => false
    t.boolean  "top",                 :default => false
    t.integer  "shares_count",        :default => 0
    t.string   "logo_file_name"
    t.string   "logo_content_type"
    t.integer  "logo_file_size"
    t.datetime "logo_updated_at"
    t.string   "poster_file_name"
    t.string   "poster_content_type"
    t.integer  "poster_file_size"
    t.datetime "poster_updated_at"
    t.string   "latitude"
    t.string   "longitude"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "activity_articles", :force => true do |t|
    t.integer  "activity_id"
    t.integer  "article_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "activity_items", :force => true do |t|
    t.integer  "activity_id"
    t.integer  "item_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "activity_reports", :force => true do |t|
    t.string   "title"
    t.text     "content"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "applies", :force => true do |t|
    t.integer  "user_id"
    t.integer  "archetype_id"
    t.boolean  "passed",       :default => false
    t.string   "reason"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "archetype_articles", :force => true do |t|
    t.integer  "archetype_id"
    t.integer  "article_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "archetype_users", :force => true do |t|
    t.integer  "archetype_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "archetypes", :force => true do |t|
    t.string   "name"
    t.integer  "channel_id"
    t.integer  "category_id"
    t.integer  "area_id"
    t.integer  "position",          :default => 0
    t.integer  "hot_count",         :default => 0
    t.integer  "likes_count",       :default => 0
    t.integer  "shares_count",      :default => 0
    t.integer  "comments_count",    :default => 0
    t.integer  "scores_count",      :default => 0
    t.text     "intro"
    t.string   "latitude"
    t.string   "longitude"
    t.string   "logo_file_name"
    t.string   "logo_content_type"
    t.integer  "logo_file_size"
    t.datetime "logo_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "areas", :force => true do |t|
    t.string   "name"
    t.integer  "position"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "article_items", :force => true do |t|
    t.integer  "article_id"
    t.integer  "user_id"
    t.string   "category"
    t.string   "name"
    t.string   "brand"
    t.decimal  "price",               :precision => 8, :scale => 2, :default => 0.0
    t.string   "buy_place"
    t.string   "unique_id"
    t.boolean  "is_new",                                            :default => false
    t.boolean  "suggest",                                           :default => false
    t.boolean  "top",                                               :default => false
    t.integer  "likes_count",                                       :default => 0
    t.integer  "comments_count",                                    :default => 0
    t.integer  "collects_count",                                    :default => 0
    t.integer  "position",                                          :default => 0
    t.string   "summary"
    t.string   "poster_file_name"
    t.string   "poster_content_type"
    t.integer  "poster_file_size"
    t.datetime "poster_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "articles", :force => true do |t|
    t.integer  "user_id"
    t.string   "title"
    t.string   "other_title"
    t.text     "summary"
    t.text     "content"
    t.integer  "area_id"
    t.integer  "channel_id"
    t.integer  "category_id"
    t.string   "video_code"
    t.string   "poster_file_name"
    t.string   "poster_content_type"
    t.integer  "poster_file_size"
    t.datetime "poster_updated_at"
    t.integer  "likes_count",                                       :default => 0
    t.integer  "shares_count",                                      :default => 0
    t.integer  "collections_count",                                 :default => 0
    t.integer  "comments_count",                                    :default => 0
    t.integer  "state",                                             :default => 1
    t.integer  "source_type",                                       :default => 0
    t.boolean  "is_article",                                        :default => false
    t.boolean  "is_photo",                                          :default => false
    t.boolean  "is_video",                                          :default => false
    t.boolean  "is_news",                                           :default => false
    t.boolean  "is_activity",                                       :default => false
    t.boolean  "is_company",                                        :default => false
    t.boolean  "is_brand",                                          :default => false
    t.boolean  "is_item",                                           :default => false
    t.boolean  "is_groupbuy",                                       :default => false
    t.boolean  "is_discount",                                       :default => false
    t.string   "schedule"
    t.string   "place"
    t.string   "address"
    t.string   "telphone"
    t.string   "office_time"
    t.string   "bus_info"
    t.string   "discount"
    t.string   "website"
    t.string   "shop_name"
    t.string   "brand_name"
    t.string   "begin_time"
    t.string   "end_time"
    t.string   "brand_desc"
    t.string   "groupbuy_desc"
    t.string   "category"
    t.string   "area"
    t.string   "province"
    t.string   "city"
    t.string   "map"
    t.decimal  "price",               :precision => 8, :scale => 2, :default => 0.0
    t.string   "buy_place"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "articles", ["user_id"], :name => "index_articles_on_user_id"

  create_table "banners", :force => true do |t|
    t.string   "title"
    t.string   "summary"
    t.string   "gourl"
    t.integer  "position",            :default => 0
    t.integer  "category",            :default => 0
    t.string   "poster_file_name"
    t.string   "poster_content_type"
    t.integer  "poster_file_size"
    t.datetime "poster_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "brand_articles", :force => true do |t|
    t.integer  "brand_id"
    t.integer  "article_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "brand_users", :force => true do |t|
    t.integer  "user_id"
    t.integer  "brand_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "brands", :force => true do |t|
    t.string   "name"
    t.integer  "channel_id"
    t.integer  "hot_count",         :default => 0
    t.integer  "discount_count",    :default => 0
    t.integer  "scores_count",      :default => 0
    t.text     "intro"
    t.string   "logo_file_name"
    t.string   "logo_content_type"
    t.integer  "logo_file_size"
    t.datetime "logo_updated_at"
    t.boolean  "tmp",               :default => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "categories", :force => true do |t|
    t.string   "name"
    t.integer  "position"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "category_items", :force => true do |t|
    t.integer  "category_id"
    t.integer  "item_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "channels", :force => true do |t|
    t.string   "name"
    t.integer  "position",   :default => 0
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
    t.integer  "state",      :default => 1
    t.integer  "star",       :default => 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "coupons", :force => true do |t|
    t.integer  "archetype_id"
    t.text     "content"
    t.string   "dateintro"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "districts", :force => true do |t|
    t.integer  "area_id"
    t.integer  "archetype_id"
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

  create_table "hot_tags", :force => true do |t|
    t.string   "name"
    t.integer  "position",   :default => 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "item_reports", :force => true do |t|
    t.string   "title"
    t.text     "content"
    t.integer  "user_id"
    t.decimal  "price",      :precision => 8, :scale => 2, :default => 0.0
    t.string   "brand_name"
    t.integer  "brand_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "items", :force => true do |t|
    t.string   "unique_id"
    t.string   "title"
    t.decimal  "price",               :precision => 8, :scale => 2, :default => 0.0
    t.integer  "brand_id"
    t.text     "content",                                           :default => ""
    t.integer  "state",                                             :default => 1
    t.boolean  "store",                                             :default => false
    t.boolean  "suggest",                                           :default => false
    t.boolean  "top",                                               :default => false
    t.integer  "likes_count",                                       :default => 0
    t.integer  "comments_count",                                    :default => 0
    t.integer  "collects_count",                                    :default => 0
    t.integer  "position",                                          :default => 0
    t.string   "summary"
    t.integer  "stars_count",                                       :default => 0
    t.integer  "stars_score",                                       :default => 0
    t.string   "poster_file_name"
    t.string   "poster_content_type"
    t.integer  "poster_file_size"
    t.datetime "poster_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "likes", :force => true do |t|
    t.integer  "user_id"
    t.string   "klass_type"
    t.integer  "klass_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "messages", :force => true do |t|
    t.integer  "user_id"
    t.integer  "send_by"
    t.boolean  "sysmsg",     :default => false
    t.boolean  "top",        :default => false
    t.boolean  "read",       :default => false
    t.string   "title"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pages", :force => true do |t|
    t.string   "title"
    t.text     "content"
    t.integer  "category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "photo_temps", :force => true do |t|
    t.string   "file_file_name"
    t.string   "file_content_type"
    t.integer  "file_file_size"
    t.datetime "file_updated_at"
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

  create_table "relationships", :force => true do |t|
    t.integer  "follower_id"
    t.integer  "followed_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "relationships", ["followed_id"], :name => "index_relationships_on_followed_id"
  add_index "relationships", ["follower_id", "followed_id"], :name => "index_relationships_on_follower_id_and_followed_id", :unique => true
  add_index "relationships", ["follower_id"], :name => "index_relationships_on_follower_id"

  create_table "reports", :force => true do |t|
    t.integer  "channel_id"
    t.integer  "category_id"
    t.integer  "area_id"
    t.integer  "user_id"
    t.string   "opening_date"
    t.text     "content"
    t.string   "info_from"
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

  create_table "user_items", :force => true do |t|
    t.integer  "user_id"
    t.integer  "item_id"
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
    t.integer  "articles_count",      :default => 0
    t.integer  "followers_count",     :default => 0
    t.integer  "followings_count",    :default => 0
    t.integer  "favorites_count",     :default => 0
    t.integer  "scores",              :default => 0
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.integer  "promotion",           :default => 10
    t.boolean  "deleted",             :default => false
    t.integer  "role",                :default => 0
    t.integer  "upgrade_state",       :default => 0
    t.integer  "star",                :default => 0
    t.boolean  "todaystar",           :default => false
    t.boolean  "suggest",             :default => false
    t.string   "intro"
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
