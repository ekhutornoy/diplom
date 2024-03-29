class Stock < ActiveRecord::Base
  attr_accessible :amount, :department_id, :product_id, :company_id

  belongs_to :product
  belongs_to :department
  belongs_to :company

  validates_presence_of :company

  def update_amount
    current_amount = IncomeItem.
      where(:product_id => product_id, :department_id => department_id).
      sum(:amount) - SaleItem.
      where(:product_id => product_id, :department_id => department_id).
      sum(:amount)
    update_attributes! :amount => current_amount
  end
end
