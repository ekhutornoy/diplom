class SaleOrder < ActiveRecord::Base
  attr_accessible :client, :date, :sale_items_attributes, :company_id, :user_id
  has_many :sale_items, :dependent => :destroy
  belongs_to :company
  belongs_to :user
  accepts_nested_attributes_for :sale_items
  validates_presence_of :user
  validates_presence_of :company

  before_validation :set_company, :on => :create
  after_save :update_stocks

  def update_stocks
    sale_items.each &:update_stocks
  end

  protected

  def set_company
    self.company = user.company
    sale_items.each do |i|
      i.company = company
    end
  end
end
