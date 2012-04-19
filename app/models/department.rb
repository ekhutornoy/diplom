class Department < ActiveRecord::Base
  attr_accessible :name, :company_id

  has_many :stocks, :dependent => :destroy
  belongs_to :company

  validates_presence_of :company
end
