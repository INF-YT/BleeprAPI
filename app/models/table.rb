class Table < ActiveRecord::Base
  has_many :occupancies
  has_many :orders
end
