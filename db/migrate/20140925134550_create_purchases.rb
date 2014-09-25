class CreatePurchases < ActiveRecord::Migration
  def change
    create_table :purchases do |t|
      t.string :name
      t.integer :amount
      t.text :description

      t.timestamps
    end
  end
end
