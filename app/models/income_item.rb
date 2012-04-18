class IncomeItem < ActiveRecord::Base
  belongs_to :income
  belongs_to :product
  belongs_to :company
  attr_accessible :amount, :price, :product_id, :company_id

  def update_stocks
    stock.update_amount
  end

  def stock
    Stock.find_or_create_by_department_id_and_product_id(
      income.department_id, product_id)
  end
end
