class AddFeedbackToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :feedback, :integer
  end
end
