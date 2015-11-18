class Order < ActiveRecord::Base
  belongs_to :card
  belongs_to :table
end
