# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_08_17_025446) do
  create_table "descriptions", force: :cascade do |t|
    t.string "genre"
    t.integer "player_limit"
    t.text "description_text"
    t.string "description_title"
    t.integer "game_posting_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["game_posting_id"], name: "index_descriptions_on_game_posting_id"
  end

  create_table "friends", force: :cascade do |t|
    t.string "invite_status"
    t.integer "player_profile_id", null: false
    t.integer "friend_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["friend_id"], name: "index_friends_on_friend_id"
    t.index ["player_profile_id"], name: "index_friends_on_player_profile_id"
  end

  create_table "friendships", force: :cascade do |t|
    t.integer "user_profile_id", null: false
    t.integer "friend_id", null: false
    t.string "invite_status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "player_profile_id"
    t.index ["friend_id"], name: "index_friendships_on_friend_id"
    t.index ["player_profile_id"], name: "index_friendships_on_player_profile_id"
  end

  create_table "game_postings", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "player_games", force: :cascade do |t|
    t.integer "player_profile_id"
    t.integer "game_posting_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["game_posting_id"], name: "index_player_games_on_game_posting_id"
    t.index ["player_profile_id"], name: "index_player_games_on_player_profile_id"
  end

  create_table "player_profiles", force: :cascade do |t|
    t.string "username"
    t.string "email"
    t.string "password"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
  end

  add_foreign_key "descriptions", "game_postings"
  add_foreign_key "friends", "player_profiles"
  add_foreign_key "friends", "player_profiles", column: "friend_id"
  add_foreign_key "friendships", "player_profiles"
  add_foreign_key "friendships", "player_profiles", column: "friend_id"
  add_foreign_key "player_games", "game_postings"
  add_foreign_key "player_games", "player_profiles"
end
