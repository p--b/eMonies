class Acceptance < ActiveRecord::Base
  attr_accessible :amount, :note

  belongs_to :person
  belongs_to :purchase
end
