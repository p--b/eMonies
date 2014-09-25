class Acceptance < ActiveRecord::Base
  attr_accessible :amount, :note

  belongs_to :person
end
