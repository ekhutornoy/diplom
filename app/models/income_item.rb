class IncomeItem < ActiveRecord::Base
  belongs_to :income
  belongs_to :product
  belongs_to :company
  attr_accessible :amount, :price, :product_id, :company_id
  validates_presence_of :company

  def update_stocks
    stock.update_amount
  end

  def stock
    company.stocks.find_or_create_by_department_id_and_product_id(
      income.department_id, product_id)
  end
end
