class Purchase < ActiveRecord::Base
  validates :name, presence: true
  validates :amount, presence: true
  validates :amount, numericality: true
  validates :person_id, presence: true

  belongs_to :person
  has_many :acceptances
end
