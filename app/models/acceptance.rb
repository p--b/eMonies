class Acceptance < ActiveRecord::Base
  belongs_to :person
  belongs_to :purchase
end
