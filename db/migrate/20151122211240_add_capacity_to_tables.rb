class AddCapacityToTables < ActiveRecord::Migration
  def change
    add_column :tables, :capacity, :integer
  end
end
