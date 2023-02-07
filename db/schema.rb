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

ActiveRecord::Schema[7.0].define(version: 2023_02_07_111139) do
  create_table "bugs", force: :cascade do |t|
    t.string "title", null: false
    t.text "description"
    t.datetime "deadline"
    t.string "screenshot"
    t.string "type", null: false
    t.string "status", null: false
    t.integer "project_id", null: false
    t.integer "creator_id", null: false
    t.integer "solver_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["title"], name: "index_bugs_on_title", unique: true
  end

  create_table "projects", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "userprojects", force: :cascade do |t|
    t.integer "user_id"
    t.integer "project_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["project_id"], name: "index_userprojects_on_project_id"
    t.index ["user_id"], name: "index_userprojects_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.integer "user_type"
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "bugs", "projects"
  add_foreign_key "bugs", "users", column: "creator_id"
  add_foreign_key "bugs", "users", column: "solver_id"
  add_foreign_key "userprojects", "projects"
  add_foreign_key "userprojects", "users"
end
