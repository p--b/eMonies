class MinimalTransactions < ActiveRecord::Migration
  def change
    create_table :minimal_transactions do |t|
      t.integer :from_person_id
      t.integer :to_person_id
      t.integer :amount
    end
  end
end
