class Product < ActiveRecord::Base
  attr_accessible :description, :name, :num, :category_id, :company_id

  has_many :stocks, :dependent => :destroy
  has_many :income_items, :dependent => :destroy
  has_many :sale_items, :dependent => :destroy
  belongs_to :category
  belongs_to :company

  validates_presence_of :company
end
