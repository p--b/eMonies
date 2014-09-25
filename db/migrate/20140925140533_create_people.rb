class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :name
      t.string :username
      t.string :password
      t.integer :account_number
      t.integer :sort_code

      t.timestamps
    end
  end
end
