class Stock < ActiveRecord::Base
  attr_accessible :amount, :department_id, :product_id
end
