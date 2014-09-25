class Passwords < ActiveRecord::Migration
  def change
    remove_column :people, :password
    add_column :people, :encrypted_password, :text
  end
end
