class Bleepr < ActiveRecord::Base
  self.primary_key = "id"
  belongs_to :table
end
