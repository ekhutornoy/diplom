class IncomeItem < ActiveRecord::Base
  belongs_to :income
  belongs_to :product
  attr_accessible :amount, :price
end
