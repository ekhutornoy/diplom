class Income < ActiveRecord::Base
  belongs_to :department
  has_many :income_items, :dependent => :destroy
  belongs_to :company
  belongs_to :user
  accepts_nested_attributes_for :income_items, :reject_if => proc { |attributes| attributes['product_id'].blank? || attributes['amount'].blank? }, :allow_destroy => true
  attr_accessible :date, :supplier, :department_id, :income_items_attributes, :company_id, :user_id
  validates_presence_of :user
  validates_presence_of :company

  before_validation :set_company, :on => :create
  before_validation :set_department

  protected

  def set_company
    self.company = user.company
    income_items.each do |i|
      i.company = company
    end
  end

  def set_department
    income_items.each do |i|
      i.department = department
    end
  end


end
