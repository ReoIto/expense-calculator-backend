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

ActiveRecord::Schema[7.0].define(version: 2023_02_16_135643) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pgcrypto"
  enable_extension "plpgsql"

  create_table "dealings", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.integer "status", default: 0, null: false
    t.uuid "user_id", null: false
    t.uuid "expense_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["expense_id"], name: "index_dealings_on_expense_id"
    t.index ["user_id"], name: "index_dealings_on_user_id"
  end

  create_table "debt_and_users", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "debt_id", null: false
    t.uuid "from_user_id", null: false
    t.uuid "to_user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["debt_id"], name: "index_debt_and_users_on_debt_id"
    t.index ["from_user_id"], name: "index_debt_and_users_on_from_user_id"
    t.index ["to_user_id"], name: "index_debt_and_users_on_to_user_id"
  end

  create_table "debts", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.integer "amount", default: 0, null: false
    t.integer "status", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "expense_and_rules", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "expense_id", null: false
    t.uuid "rule_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["expense_id"], name: "index_expense_and_rules_on_expense_id"
    t.index ["rule_id"], name: "index_expense_and_rules_on_rule_id"
  end

  create_table "expense_details", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "expense_id", null: false
    t.uuid "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "amount"
    t.string "type"
    t.index ["expense_id"], name: "index_expense_details_on_expense_id"
    t.index ["user_id"], name: "index_expense_details_on_user_id"
  end

  create_table "expenses", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.integer "amount", default: 0, null: false
    t.uuid "group_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "expense_reason"
    t.index ["group_id"], name: "index_expenses_on_group_id"
  end

  create_table "group_and_users", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "user_id", null: false
    t.uuid "group_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["group_id"], name: "index_group_and_users_on_group_id"
    t.index ["user_id"], name: "index_group_and_users_on_user_id"
  end

  create_table "groups", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name", null: false
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "payment_methods", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name"
    t.uuid "expense_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["expense_id"], name: "index_payment_methods_on_expense_id"
  end

  create_table "receipts", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "image_path"
    t.uuid "expense_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["expense_id"], name: "index_receipts_on_expense_id"
  end

  create_table "rules", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.integer "amount", default: 0, null: false
    t.boolean "is_discount_rule", default: false, null: false
    t.boolean "is_extra_charge_rule", default: false, null: false
    t.uuid "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_rules_on_user_id"
  end

  create_table "users", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "dealings", "expenses"
  add_foreign_key "dealings", "users"
  add_foreign_key "debt_and_users", "debts"
  add_foreign_key "debt_and_users", "users", column: "from_user_id"
  add_foreign_key "debt_and_users", "users", column: "to_user_id"
  add_foreign_key "expense_and_rules", "expenses"
  add_foreign_key "expense_and_rules", "rules"
  add_foreign_key "expense_details", "expenses"
  add_foreign_key "expense_details", "users"
  add_foreign_key "expenses", "groups"
  add_foreign_key "group_and_users", "groups"
  add_foreign_key "group_and_users", "users"
  add_foreign_key "payment_methods", "expenses"
  add_foreign_key "receipts", "expenses"
  add_foreign_key "rules", "users"
end
