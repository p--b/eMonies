class Owedness < ActiveRecord::Migration
  def change
    create_table :ownednesses do |t|
      t.integer :from_person_id
      t.integer :to_person_id
      t.integer :amount
    end
  end
end
