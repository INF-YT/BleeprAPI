class AddCoversToOccupancies < ActiveRecord::Migration
  def change
    add_column :occupancies, :covers, :integer
  end
end
