class Purchase < ActiveRecord::Base
  attr_accessible :amount, :description, :name
end
