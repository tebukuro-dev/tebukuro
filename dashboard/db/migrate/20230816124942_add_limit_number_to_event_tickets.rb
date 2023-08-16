class AddLimitNumberToEventTickets < ActiveRecord::Migration[7.0]
  def change
    add_column :event_tickets, :limit_number, :integer, null: false, default: 0
  end
end
