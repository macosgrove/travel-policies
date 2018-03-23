class CreateQuotes < ActiveRecord::Migration[5.1]
  def change
    create_table :quotes do |t|
      t.integer :age
      t.decimal :trip_length
      t.integer :quote_cents
      t.string :quote_currency

      t.timestamps
    end
  end
end
