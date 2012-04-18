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

ActiveRecord::Schema.define(:version => 20120418210417) do

  create_table "categories", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "ancestry"
    t.integer  "company_id"
  end

  add_index "categories", ["ancestry"], :name => "index_categories_on_ancestry"
  add_index "categories", ["company_id"], :name => "index_categories_on_company_id"

  create_table "companies", :force => true do |t|
    t.string   "name"
    t.string   "phone"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "departments", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "company_id"
  end

  add_index "departments", ["company_id"], :name => "index_departments_on_company_id"

  create_table "income_items", :force => true do |t|
    t.integer  "income_id",  :null => false
    t.integer  "product_id", :null => false
    t.integer  "amount",     :null => false
    t.decimal  "price",      :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "company_id"
  end

  add_index "income_items", ["company_id"], :name => "index_income_items_on_company_id"
  add_index "income_items", ["income_id"], :name => "index_income_items_on_income_id"
  add_index "income_items", ["product_id"], :name => "index_income_items_on_product_id"

  create_table "incomes", :force => true do |t|
    t.date     "date"
    t.integer  "department_id", :null => false
    t.string   "supplier"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.integer  "company_id"
  end

  add_index "incomes", ["company_id"], :name => "index_incomes_on_company_id"
  add_index "incomes", ["department_id"], :name => "index_incomes_on_department_id"

  create_table "products", :force => true do |t|
    t.string   "num"
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.integer  "category_id"
    t.integer  "company_id"
  end

  add_index "products", ["company_id"], :name => "index_products_on_company_id"

  create_table "sale_items", :force => true do |t|
    t.integer  "sale_order_id"
    t.integer  "department_id"
    t.integer  "product_id"
    t.integer  "amount"
    t.decimal  "price"
    t.decimal  "sum"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.integer  "company_id"
  end

  add_index "sale_items", ["company_id"], :name => "index_sale_items_on_company_id"
  add_index "sale_items", ["department_id"], :name => "index_sale_items_on_department_id"
  add_index "sale_items", ["product_id"], :name => "index_sale_items_on_product_id"
  add_index "sale_items", ["sale_order_id"], :name => "index_sale_items_on_sale_order_id"

  create_table "sale_orders", :force => true do |t|
    t.date     "date"
    t.string   "client"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "company_id"
  end

  add_index "sale_orders", ["company_id"], :name => "index_sale_orders_on_company_id"

  create_table "stocks", :force => true do |t|
    t.integer  "department_id"
    t.integer  "product_id"
    t.integer  "amount",        :default => 0, :null => false
    t.datetime "created_at",                   :null => false
    t.datetime "updated_at",                   :null => false
    t.integer  "company_id"
  end

  add_index "stocks", ["company_id"], :name => "index_stocks_on_company_id"

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "",    :null => false
    t.string   "encrypted_password",     :default => "",    :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                                :null => false
    t.datetime "updated_at",                                :null => false
    t.integer  "company_id"
    t.boolean  "admin",                  :default => false, :null => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
