class Stock < ActiveRecord::Base
  attr_accessible :amount, :department_id, :product_id, :company_id

  belongs_to :product
  belongs_to :department
  belongs_to :company

  def update_amount
    current_amount = IncomeItem.joins(:income).
      where(:product_id => product_id,
      'incomes.department_id' => department_id).
      sum(:amount)
    current_amount -= SaleItem.
      where(:product_id => product_id, :department_id => department_id).
      sum(:amount)
    update_attributes! :amount => current_amount
  end
end
