class SaleItem < ActiveRecord::Base
  belongs_to :sale_order
  belongs_to :department
  belongs_to :product
  belongs_to :company
  attr_accessible :amount, :price, :sum, :department_id, :product_id, :company_id

  validates_presence_of :company

  after_save :update_stocks
  after_destroy :update_stocks

  attr_accessor :old_department_id, :old_product_id
  before_save :remember_changes

  def update_stocks
    update_stock(department_id, product_id)
    update_stock(old_department_id, product_id) if old_department_id
    update_stock(department_id, old_product_id) if old_product_id
    if old_department_id && old_product_id
      update_stock(old_department_id, old_product_id)
    end
  end

  def update_stock(did, pid)
    company.stocks.
      find_or_create_by_department_id_and_product_id(did, pid).
      update_amount
  end

  protected

  def remember_changes
    self.old_department_id = department_id_was if department_id_changed?
    self.old_product_id = product_id_was if product_id_changed?
  end
end
