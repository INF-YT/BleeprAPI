class Table < ActiveRecord::Base
  has_many :occupancies
  has_many :orders

  def free_at(start_time)
    Occupancy.where("start >= ?", start_time).where("end <= ? OR end = NULL", start_time + 2.hours).count == 0
  end
end
