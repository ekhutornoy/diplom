class IncomeItem < ActiveRecord::Base
  belongs_to :income
  belongs_to :product
  belongs_to :company
  belongs_to :department
  attr_accessible :amount, :price, :product_id, :company_id
  validates_presence_of :company
  validates_presence_of :department

  after_save :update_stocks
  after_destroy :update_stocks

  def update_stocks
    stock.update_amount
  end

  def stock
    company.stocks.find_or_create_by_department_id_and_product_id(
      department_id, product_id)
  end
end
