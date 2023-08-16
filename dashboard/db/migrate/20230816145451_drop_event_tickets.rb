class DropEventTickets < ActiveRecord::Migration[7.0]
  def change
    drop_table :event_tickets do |t|
      t.string :name, null: false
      t.references :event, null: false, foreign_key: true

      t.timestamps

      t.integer :limit_number, null: false, default: 0
      t.index [:name, :event_id], unique: true
    end
  end
end
