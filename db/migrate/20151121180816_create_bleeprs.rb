class CreateBleeprs < ActiveRecord::Migration
  def change
    create_table :bleeprs, id: false do |t|
      t.string :id, null: false, index: true
      t.references :table, index: true, foreign_key: true
      t.boolean :is_active

      t.timestamps null: false
    end
  end
end
