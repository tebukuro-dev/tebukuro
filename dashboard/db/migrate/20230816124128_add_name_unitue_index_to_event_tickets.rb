class AddNameUnitueIndexToEventTickets < ActiveRecord::Migration[7.0]
  def change
    add_index :event_tickets, [:name, :event_id], unique: true
  end
end
