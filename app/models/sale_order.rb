class SaleOrder < ActiveRecord::Base
  attr_accessible :client, :date, :sale_items_attributes
  has_many :sale_items
  accepts_nested_attributes_for :sale_items
end
