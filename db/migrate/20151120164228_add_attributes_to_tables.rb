class AddAttributesToTables < ActiveRecord::Migration
  def change
    add_column :tables, :position_x, :integer
    add_column :tables, :position_y, :integer
    add_column :tables, :width, :integer
    add_column :tables, :height, :integer
  end
end
