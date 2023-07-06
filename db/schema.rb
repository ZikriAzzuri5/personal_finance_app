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

ActiveRecord::Schema[7.0].define(version: 2023_06_11_030527) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string "name", null: false
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.bigint "transaction_type_id", null: false
    t.index ["transaction_type_id"], name: "index_categories_on_transaction_type_id"
    t.index ["user_id"], name: "index_categories_on_user_id"
  end

  create_table "contacts", force: :cascade do |t|
    t.string "name"
    t.string "phone_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "currencies", force: :cascade do |t|
    t.string "code", null: false
    t.string "country_code", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "transaction_templates", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "amount_in_decimal", null: false
    t.string "description"
    t.bigint "category_id"
    t.bigint "transaction_type_id", null: false
    t.bigint "user_id", null: false
    t.bigint "wallet_id", null: false
    t.string "recurring_type"
    t.integer "recurring_step"
    t.date "recurring_end_date"
    t.date "recurring_start_date"
    t.integer "source_wallet_id"
    t.integer "child_transaction_id"
    t.string "contact_name"
    t.index ["category_id"], name: "index_transaction_templates_on_category_id"
    t.index ["transaction_type_id"], name: "index_transaction_templates_on_transaction_type_id"
    t.index ["user_id"], name: "index_transaction_templates_on_user_id"
    t.index ["wallet_id"], name: "index_transaction_templates_on_wallet_id"
  end

  create_table "transaction_types", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "transactions", force: :cascade do |t|
    t.integer "amount_in_decimal", null: false
    t.datetime "transaction_at", precision: nil, null: false
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "wallet_id", null: false
    t.bigint "user_id", null: false
    t.bigint "transaction_type_id", null: false
    t.bigint "category_id"
    t.integer "source_wallet_id"
    t.integer "child_transaction_id"
    t.string "contact_name"
    t.index ["category_id"], name: "index_transactions_on_category_id"
    t.index ["transaction_type_id"], name: "index_transactions_on_transaction_type_id"
    t.index ["user_id"], name: "index_transactions_on_user_id"
    t.index ["wallet_id"], name: "index_transactions_on_wallet_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", null: false
    t.string "password_digest", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
  end

  create_table "wallet_types", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "wallets", force: :cascade do |t|
    t.string "name", null: false
    t.integer "amount_in_decimal", null: false
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.bigint "wallet_type_id", null: false
    t.bigint "currency_id", null: false
    t.index ["currency_id"], name: "index_wallets_on_currency_id"
    t.index ["user_id"], name: "index_wallets_on_user_id"
    t.index ["wallet_type_id"], name: "index_wallets_on_wallet_type_id"
  end

  add_foreign_key "categories", "transaction_types"
  add_foreign_key "categories", "users"
  add_foreign_key "transaction_templates", "categories"
  add_foreign_key "transaction_templates", "transaction_templates", column: "child_transaction_id"
  add_foreign_key "transaction_templates", "transaction_types"
  add_foreign_key "transaction_templates", "users"
  add_foreign_key "transaction_templates", "wallets"
  add_foreign_key "transaction_templates", "wallets", column: "source_wallet_id"
  add_foreign_key "transactions", "categories"
  add_foreign_key "transactions", "transaction_types"
  add_foreign_key "transactions", "transactions", column: "child_transaction_id"
  add_foreign_key "transactions", "users"
  add_foreign_key "transactions", "wallets"
  add_foreign_key "transactions", "wallets", column: "source_wallet_id"
  add_foreign_key "wallets", "currencies"
  add_foreign_key "wallets", "users"
  add_foreign_key "wallets", "wallet_types"
end
