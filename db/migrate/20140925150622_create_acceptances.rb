class CreateAcceptances < ActiveRecord::Migration
  def change
    create_table :acceptances do |t|
      t.integer :amount
      t.text :note

      t.timestamps
    end
  end
end
