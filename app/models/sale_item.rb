class SaleItem < ActiveRecord::Base
  belongs_to :sale_order
  belongs_to :department
  belongs_to :product
  attr_accessible :amount, :price, :sum, :department_id, :product_id

  def update_stocks
    stock.update_amount
  end

  def stock
    Stock.find_by_department_id_and_product_id(department_id, product_id)
  end
end
