class Acceptance < ActiveRecord::Base
  validates :amount, numericality: true
  validates :amount, presence: true
  validates :person_id, presence: true
  validates :purcahes_id, presence: true

  belongs_to :person
  belongs_to :purchase
end
