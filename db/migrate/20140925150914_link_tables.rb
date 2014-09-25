class LinkTables < ActiveRecord::Migration
  def change
    add_column :purchases, :person, :belongs_to
    add_column :acceptances, :person, :belongs_to
  end
end
