class Category < ActiveRecord::Base
  attr_accessible :name, :company_id
  has_many :products
  has_ancestry
  belongs_to :company
end
