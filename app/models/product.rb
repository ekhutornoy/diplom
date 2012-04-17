class Product < ActiveRecord::Base
  attr_accessible :description, :name, :num

  has_many :stocks, :dependent => :destroy
  belongs_to :category
end
