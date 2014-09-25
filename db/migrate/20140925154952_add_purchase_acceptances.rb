class AddPurchaseAcceptances < ActiveRecord::Migration
  def change
    add_column :acceptances, :purchase_id, :integer
  end
end
