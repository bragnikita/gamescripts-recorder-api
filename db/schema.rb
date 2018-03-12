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

ActiveRecord::Schema.define(version: 20180309102139) do

  create_table "character_lists", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "owner_id", null: false
    t.index ["owner_id"], name: "index_character_lists_on_owner_id"
  end

  create_table "characters", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "fullname"
    t.string "display_name"
    t.string "prefixes"
    t.string "css_color"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "creator_id"
    t.bigint "avatar_id"
    t.index ["avatar_id"], name: "index_characters_on_avatar_id"
    t.index ["creator_id"], name: "index_characters_on_creator_id"
  end

  create_table "characters_and_lists", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "character_lists_id"
    t.bigint "characters_id"
    t.index ["character_lists_id"], name: "index_characters_and_lists_on_character_lists_id"
    t.index ["characters_id"], name: "index_characters_and_lists_on_characters_id"
  end

  create_table "images", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "link"
    t.string "type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "added_by_id", null: false
    t.index ["added_by_id"], name: "index_images_on_added_by_id"
  end

  create_table "script_characters", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "scripts_id"
    t.bigint "characters_id"
    t.index ["characters_id"], name: "index_script_characters_on_characters_id"
    t.index ["scripts_id"], name: "index_script_characters_on_scripts_id"
  end

  create_table "scripts", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "title"
    t.text "data"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "owner_id"
    t.bigint "chara_candidates_id"
    t.index ["chara_candidates_id"], name: "index_scripts_on_chara_candidates_id"
    t.index ["owner_id"], name: "index_scripts_on_owner_id"
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "username", limit: 50
    t.string "password", limit: 50
    t.string "email", limit: 50
    t.boolean "is_admin", default: false
    t.boolean "is_active", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "avatar_id"
    t.index ["avatar_id"], name: "index_users_on_avatar_id", unique: true
  end

  add_foreign_key "character_lists", "users", column: "owner_id", on_delete: :cascade
  add_foreign_key "characters", "images", column: "avatar_id"
  add_foreign_key "characters", "users", column: "creator_id", on_delete: :nullify
  add_foreign_key "characters_and_lists", "character_lists", column: "character_lists_id"
  add_foreign_key "characters_and_lists", "characters", column: "characters_id"
  add_foreign_key "images", "users", column: "added_by_id"
  add_foreign_key "script_characters", "characters", column: "characters_id"
  add_foreign_key "script_characters", "scripts", column: "scripts_id"
  add_foreign_key "scripts", "character_lists", column: "chara_candidates_id", on_delete: :nullify
  add_foreign_key "scripts", "users", column: "owner_id", on_delete: :nullify
  add_foreign_key "users", "images", column: "avatar_id"
end
