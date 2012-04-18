class Company < ActiveRecord::Base
  attr_accessible :name, :phone
  has_many :users
end
