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

ActiveRecord::Schema.define(version: 2023_01_10_104450) do

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.integer "parent_category_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["parent_category_id"], name: "index_categories_on_parent_category_id"
  end

  create_table "csv_uploads", force: :cascade do |t|
    t.string "bank"
    t.string "filename"
    t.integer "transactions_id"
    t.integer "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["transactions_id"], name: "index_csv_uploads_on_transactions_id"
    t.index ["user_id"], name: "index_csv_uploads_on_user_id"
  end

  create_table "transactions", force: :cascade do |t|
    t.decimal "amount"
    t.string "particulars"
    t.string "reference"
    t.string "details"
    t.string "code"
    t.date "date"
    t.string "transaction_type"
    t.integer "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "csv_upload_id"
    t.integer "category_id"
    t.integer "prospective_category_id"
    t.string "google_places_category"
    t.index ["category_id"], name: "index_transactions_on_category_id"
    t.index ["csv_upload_id"], name: "index_transactions_on_csv_upload_id"
    t.index ["prospective_category_id"], name: "index_transactions_on_prospective_category_id"
    t.index ["user_id"], name: "index_transactions_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "social_photo_url"
    t.string "first_name"
    t.string "last_name"
    t.string "google_id"
    t.string "image_url"
    t.string "google_display_name"
    t.string "selected_budget_workflow"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "views", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_views_on_email", unique: true
    t.index ["reset_password_token"], name: "index_views_on_reset_password_token", unique: true
  end

  add_foreign_key "csv_uploads", "users"
  add_foreign_key "transactions", "categories"
  add_foreign_key "transactions", "categories", column: "prospective_category_id"
  add_foreign_key "transactions", "csv_uploads"
  add_foreign_key "transactions", "users"
end
