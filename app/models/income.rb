class Income < ActiveRecord::Base
  belongs_to :department
  has_many :income_items, :dependent => :destroy
  belongs_to :company
  belongs_to :user
  accepts_nested_attributes_for :income_items
  attr_accessible :date, :supplier, :department_id, :income_items_attributes, :company_id, :user_id

  after_save :update_stocks

  def update_stocks
    income_items.each &:update_stocks
  end
end
