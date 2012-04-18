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

ActiveRecord::Schema.define(:version => 20120418181756) do

  create_table "categories", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "ancestry"
  end

  add_index "categories", ["ancestry"], :name => "index_categories_on_ancestry"

  create_table "departments", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "income_items", :force => true do |t|
    t.integer  "income_id",  :null => false
    t.integer  "product_id", :null => false
    t.integer  "amount",     :null => false
    t.decimal  "price",      :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "income_items", ["income_id"], :name => "index_income_items_on_income_id"
  add_index "income_items", ["product_id"], :name => "index_income_items_on_product_id"

  create_table "incomes", :force => true do |t|
    t.date     "date"
    t.integer  "department_id", :null => false
    t.string   "supplier"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "incomes", ["department_id"], :name => "index_incomes_on_department_id"

  create_table "products", :force => true do |t|
    t.string   "num"
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.integer  "category_id"
  end

  create_table "sale_items", :force => true do |t|
    t.integer  "sale_order_id"
    t.integer  "department_id"
    t.integer  "product_id"
    t.integer  "amount"
    t.decimal  "price"
    t.decimal  "sum"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "sale_items", ["department_id"], :name => "index_sale_items_on_department_id"
  add_index "sale_items", ["product_id"], :name => "index_sale_items_on_product_id"
  add_index "sale_items", ["sale_order_id"], :name => "index_sale_items_on_sale_order_id"

  create_table "sale_orders", :force => true do |t|
    t.date     "date"
    t.string   "client"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "stocks", :force => true do |t|
    t.integer  "department_id"
    t.integer  "product_id"
    t.integer  "amount",        :default => 0, :null => false
    t.datetime "created_at",                   :null => false
    t.datetime "updated_at",                   :null => false
  end

end
