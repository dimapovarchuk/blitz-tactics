class CreateBlitzTactics < ActiveRecord::Migration[7.0]
  def change
    create_table :blitz_tactics do |t|
      t.decimal :amount, precision: 15, scale: 2, default: 0
      t.string :company
      t.string :contragent
      t.string :currency
      t.date :date

      t.timestamps
    end
  end
end
