class Person < ActiveRecord::Base
  has_many :purchases
  has_many :acceptances, :through => :purchases
end
