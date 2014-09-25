class UsernameToEmail < ActiveRecord::Migration
  def change
    remove_column :people, :username
    add_column :people, :email, :text
    add_index :people, :email, unique: true
  end
end
