class CreateTicketPurchases < ActiveRecord::Migration[7.0]
  def change
    create_table :ticket_purchases do |t|
      t.references :ticket_type, null: false, foreign_key: true
      t.integer :number_of_purchased, null: false, default: 1

      t.timestamps
    end
  end
end
