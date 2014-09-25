class Person < ActiveRecord::Base
  attr_accessible :account_number, :name, :password, :sort_code, :username
end
