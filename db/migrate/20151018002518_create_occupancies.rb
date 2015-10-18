class CreateOccupancies < ActiveRecord::Migration
  def change
    create_table :occupancies do |t|
      t.boolean :prebooked
      t.datetime :start
      t.datetime :end
      t.boolean :occupied
      t.references :customer, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
