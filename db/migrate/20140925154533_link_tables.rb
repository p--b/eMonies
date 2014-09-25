class LinkTables < ActiveRecord::Migration
  def change
    add_column :acceptances, :person_id, :integer
    add_column :purchases, :person_id, :integer
  end
end
