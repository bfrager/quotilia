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

ActiveRecord::Schema.define(version: 20151106101748) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "boards", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "stylesheet"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "title"
    t.boolean  "private"
  end

  add_index "boards", ["user_id"], name: "index_boards_on_user_id", using: :btree

  create_table "boards_posts", id: false, force: :cascade do |t|
    t.integer "board_id", null: false
    t.integer "post_id",  null: false
  end

  create_table "boards_themes", id: false, force: :cascade do |t|
    t.integer "board_id", null: false
    t.integer "theme_id", null: false
  end

  create_table "creators", force: :cascade do |t|
    t.string   "name"
    t.string   "nationality"
    t.string   "born"
    t.string   "died"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "posts", force: :cascade do |t|
    t.string   "background"
    t.string   "stylesheet"
    t.string   "file_type"
    t.integer  "user_id"
    t.string   "repost_from"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.boolean  "private"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.text     "description"
  end

  add_index "posts", ["user_id"], name: "index_posts_on_user_id", using: :btree

  create_table "quotes", force: :cascade do |t|
    t.text     "content"
    t.integer  "likes"
    t.integer  "posts_count"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "creator_id"
  end

  add_index "quotes", ["creator_id"], name: "index_quotes_on_creator_id", using: :btree

  create_table "quotes_themes", id: false, force: :cascade do |t|
    t.integer "quote_id", null: false
    t.integer "theme_id", null: false
  end

  create_table "quotes_users", id: false, force: :cascade do |t|
    t.integer "quote_id", null: false
    t.integer "user_id",  null: false
  end

  create_table "sources", force: :cascade do |t|
    t.string   "title"
    t.string   "type"
    t.date     "date"
    t.string   "publisher"
    t.string   "edition"
    t.string   "section"
    t.string   "link"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "themes", force: :cascade do |t|
    t.string   "tag"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "themes_users", id: false, force: :cascade do |t|
    t.integer "theme_id", null: false
    t.integer "user_id",  null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "f_name"
    t.string   "l_name"
    t.string   "username"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "votes", force: :cascade do |t|
    t.integer  "votable_id"
    t.string   "votable_type"
    t.integer  "voter_id"
    t.string   "voter_type"
    t.boolean  "vote_flag"
    t.string   "vote_scope"
    t.integer  "vote_weight"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "votes", ["votable_id", "votable_type", "vote_scope"], name: "index_votes_on_votable_id_and_votable_type_and_vote_scope", using: :btree
  add_index "votes", ["voter_id", "voter_type", "vote_scope"], name: "index_votes_on_voter_id_and_voter_type_and_vote_scope", using: :btree

  add_foreign_key "boards", "users"
  add_foreign_key "posts", "users"
  add_foreign_key "quotes", "creators"
end
