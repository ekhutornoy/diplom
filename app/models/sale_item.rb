class SaleItem < ActiveRecord::Base
  belongs_to :sale_order
  belongs_to :department
  belongs_to :product
  belongs_to :company
  attr_accessible :amount, :price, :sum, :department_id, :product_id, :company_id

  validates_presence_of :company

  after_save :update_stocks
  after_destroy :update_stocks

  def update_stocks
    stock.update_amount
  end

  def stock
    company.stocks.
      find_by_department_id_and_product_id(department_id, product_id)
  end
end
