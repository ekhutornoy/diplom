class Product < ActiveRecord::Base
  attr_accessible :description, :name, :num, :category_id

  has_many :stocks, :dependent => :destroy
  belongs_to :category
end
