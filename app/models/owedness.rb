class Owedness < ActiveRecord::Base
  belongs_to :from_person, class_name: :Person
  belongs_to :to_person, class_name: :Person

  def self.owes(to, from)
    q = self.where("to_person_id = ? and from_person_id = ?", to.id, from.id)
    return q[0]["amount"] if q.size > 0
    return 0
  end
end
