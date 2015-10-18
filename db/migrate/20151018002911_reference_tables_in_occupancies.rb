class ReferenceTablesInOccupancies < ActiveRecord::Migration
  def change
    add_reference :occupancies, :table, index: true, foreign_key: true
  end
end
