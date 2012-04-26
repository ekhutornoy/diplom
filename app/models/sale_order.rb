class SaleOrder < ActiveRecord::Base
  attr_accessible :client, :date, :sale_items_attributes, :company_id, :user_id
  has_many :sale_items, :dependent => :destroy
  belongs_to :company
  belongs_to :user
  accepts_nested_attributes_for :sale_items, :allow_destroy => true, :reject_if => proc { |attributes| attributes['product_id'].blank? || attributes['amount'].blank? || attributes['department_id'].blank? }
  validates_presence_of :user
  validates_presence_of :company

  before_validation :set_company

  protected

  def set_company
    self.company = user.company
    sale_items.each do |i|
      i.company = company
    end
  end
end
