class Company < ActiveRecord::Base
  attr_accessible :name, :phone
  has_many :users
  has_many :departments
  has_many :products
  has_many :stocks
  has_many :incomes
  has_many :income_items
  has_many :sale_orders
  has_many :sale_items
  has_many :categories
end
