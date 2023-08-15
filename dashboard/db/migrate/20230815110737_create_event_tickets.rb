class CreateEventTickets < ActiveRecord::Migration[7.0]
  def change
    create_table :event_tickets do |t|
      t.string :name, null: false
      t.references :event, null: false, foreign_key: true

      t.timestamps
    end
  end
end
