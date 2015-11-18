class AddTableToOrders < ActiveRecord::Migration
  def change
    add_reference :orders, :table, index: true, foreign_key: true
    remove_reference :orders, :customer
  end
end
