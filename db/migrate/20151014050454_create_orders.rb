class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :status
      t.references :customer, index: true, foreign_key: true
      # The following is a workaround as we're using a string as a pk in cards
      t.string :card_id, index: true

      t.timestamps null: false
    end
  end
  add_foreign_key :orders, :cards
end
