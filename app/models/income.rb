class Income < ActiveRecord::Base
  belongs_to :department
  attr_accessible :date, :supplier
end
