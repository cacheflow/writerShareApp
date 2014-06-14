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

ActiveRecord::Schema.define(version: 20140614200423) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "pieces", force: true do |t|
    t.integer  "user_id"
    t.integer  "version_id"
    t.boolean  "public"
    t.boolean  "share_with_all_friends"
    t.string   "share_with_select_friends", default: [], array: true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "pieces", ["user_id"], name: "index_pieces_on_user_id", using: :btree
  add_index "pieces", ["version_id"], name: "index_pieces_on_version_id", using: :btree

  create_table "user_friendships", force: true do |t|
    t.integer  "user_id"
    t.integer  "friend_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "user_friendships", ["user_id", "friend_id"], name: "index_user_friendships_on_user_id_and_friend_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.integer  "user_friendship_id"
    t.integer  "piece_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password"
  end

  add_index "users", ["piece_id"], name: "index_users_on_piece_id", using: :btree
  add_index "users", ["user_friendship_id"], name: "index_users_on_user_friendship_id", using: :btree

  create_table "versions", force: true do |t|
    t.integer  "piece_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "versions", ["piece_id"], name: "index_versions_on_piece_id", using: :btree

end
