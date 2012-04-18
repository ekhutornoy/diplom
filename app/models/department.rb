class Department < ActiveRecord::Base
  attr_accessible :name, :company_id

  has_many :stocks, :dependent => :destroy
  belongs_to :company
end
