class Table < ActiveRecord::Base
  has_many :occupancies
  has_many :orders

  def free_at(start_time)
    occupancies.where("(start >= ? AND end <= ?) OR ? > start", start_time, start_time, start_time + 2.hours).count == 0
  end
end
