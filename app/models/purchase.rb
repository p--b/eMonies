class Purchase < ActiveRecord::Base
  belongs_to :person
  has_many :acceptances
end
