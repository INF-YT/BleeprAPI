class Occupancy < ActiveRecord::Base
  belongs_to :customer
  belongs_to :table
  validates :only_one_occupied_occupancy_per_table

  def only_one_occupied_occupancy_per_table
    if occupied && table.occupancies.where(occupied: true).count > 0
      errors.add(:occupied, "table is already occupied")
    end
  end
end
