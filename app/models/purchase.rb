class Purchase < ActiveRecord::Base
  attr_accessible :amount, :description, :name

  belongs_to :person
  has_many :acceptances
end
