class AddDeletedToTables < ActiveRecord::Migration
  def change
    add_column :tables, :deleted, :boolean
  end
end
