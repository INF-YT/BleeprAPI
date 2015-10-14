class CreateCards < ActiveRecord::Migration
  def change
    # Bit of a workaround here, as we don't want to use the default behaviour,
    # id is a string, as we're going to be using this as the card string.
    # As mentioned in http://ruby-journal.com/how-to-override-default-primary-key-id-in-rails/
    # not null + unique + index ~= primary key 
    create_table :cards, id: false do |t|
      t.string :id, null: false
      t.references :customer, index: true, foreign_key: true

      t.timestamps null: false
    end

    add_index :cards, :id, unique: true
  end
end
