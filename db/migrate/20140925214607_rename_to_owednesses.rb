class RenameToOwednesses < ActiveRecord::Migration
  def change
    drop_table :ownednesses
    create_table :owednesses do |t|
      t.integer :from_person_id
      t.integer :to_person_id
      t.integer :amount
    end
  end
end
