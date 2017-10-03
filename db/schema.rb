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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20171003151355) do

  create_table "admins", force: :cascade do |t|
    t.string   "email",              limit: 255, default: "", null: false
    t.string   "encrypted_password", limit: 255, default: "", null: false
    t.datetime "created_at",                                  null: false
    t.datetime "updated_at",                                  null: false
    t.string   "photo_file_name",    limit: 255
    t.string   "photo_content_type", limit: 255
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
  end

  create_table "band_photos", force: :cascade do |t|
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.string   "photo_file_name",    limit: 255
    t.string   "photo_content_type", limit: 255
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
  end

  create_table "bio_entries", force: :cascade do |t|
    t.string   "title",         limit: 255
    t.integer  "chapter_order"
    t.text     "content"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "concerts", force: :cascade do |t|
    t.datetime "date"
    t.string   "place",        limit: 255
    t.string   "concert_hall", limit: 255
    t.string   "tickets",      limit: 255
    t.string   "bands",        limit: 255
    t.string   "notes",        limit: 255
    t.string   "event_link",   limit: 255
    t.string   "ticket_link",  limit: 255
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "entries", force: :cascade do |t|
    t.string   "title",              limit: 255
    t.datetime "publish_date"
    t.text     "content"
    t.string   "youtube_link",       limit: 255
    t.string   "external_link",      limit: 255
    t.integer  "tag_id"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.string   "photo_file_name",    limit: 255
    t.string   "photo_content_type", limit: 255
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
  end

  create_table "images", force: :cascade do |t|
    t.integer  "photo_category_id"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.string   "photo_file_name",    limit: 255
    t.string   "photo_content_type", limit: 255
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
    t.string   "description",        limit: 255
  end

  create_table "members", force: :cascade do |t|
    t.string   "name",               limit: 255
    t.string   "instrument",         limit: 255
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.string   "photo_file_name",    limit: 255
    t.string   "photo_content_type", limit: 255
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
  end

  create_table "photo_categories", force: :cascade do |t|
    t.string   "title",              limit: 255
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.string   "photo_file_name",    limit: 255
    t.string   "photo_content_type", limit: 255
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
  end

  create_table "records", force: :cascade do |t|
    t.string   "name",               limit: 255
    t.date     "publish_date"
    t.text     "description"
    t.string   "download_link",      limit: 255
    t.boolean  "own"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.string   "photo_file_name",    limit: 255
    t.string   "photo_content_type", limit: 255
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
    t.string   "youtube_link",       limit: 255
    t.string   "spotify_link",       limit: 255
  end

  create_table "shop_items", force: :cascade do |t|
    t.string   "name",               limit: 255
    t.float    "price"
    t.integer  "relevance"
    t.string   "image_file_name",    limit: 255
    t.string   "image_content_type", limit: 255
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.text     "description"
    t.string   "external_shop_link", limit: 255
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

  create_table "slides", force: :cascade do |t|
    t.string   "title",              limit: 255
    t.string   "description",        limit: 255
    t.string   "link",               limit: 255
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.string   "photo_file_name",    limit: 255
    t.string   "photo_content_type", limit: 255
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
    t.integer  "slide_order"
    t.string   "video_file_name"
    t.string   "video_content_type"
    t.integer  "video_file_size"
    t.datetime "video_updated_at"
  end

  create_table "songs", force: :cascade do |t|
    t.string   "name",                    limit: 255
    t.text     "lyrics"
    t.integer  "track_order"
    t.integer  "record_id"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "music_file_file_name",    limit: 255
    t.string   "music_file_content_type", limit: 255
    t.integer  "music_file_file_size"
    t.datetime "music_file_updated_at"
    t.string   "url",                     limit: 255
  end

  create_table "songs_votes", id: false, force: :cascade do |t|
    t.integer "song_id"
    t.integer "vote_id"
  end

  create_table "tags", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",              default: "",    null: false
    t.string   "encrypted_password", default: "",    null: false
    t.boolean  "admin",              default: false, null: false
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true

  create_table "video_categories", force: :cascade do |t|
    t.string   "title",      limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "videos", force: :cascade do |t|
    t.string   "title",             limit: 255
    t.string   "youtube_link",      limit: 255
    t.text     "description"
    t.integer  "video_category_id"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

end
