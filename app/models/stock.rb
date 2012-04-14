class Stock < ActiveRecord::Base
  attr_accessible :amount, :department_id, :product_id

  belongs_to :product
  belongs_to :department
end
