class Income < ActiveRecord::Base
  belongs_to :department
  has_many :income_items
  accepts_nested_attributes_for :income_items
  attr_accessible :date, :supplier, :department_id, :income_items_attributes

  after_save :update_stocks

  def update_stocks
    income_items.each &:update_stocks
  end
end
