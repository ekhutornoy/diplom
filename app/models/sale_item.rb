class SaleItem < ActiveRecord::Base
  belongs_to :sale_order
  belongs_to :department
  belongs_to :product
  attr_accessible :amount, :price, :sum
end
