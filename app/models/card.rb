class Card < ActiveRecord::Base
  self.primary_key = "id"
  belongs_to :customer
end
