class TicketPurchase < ApplicationRecord
  belongs_to :ticket_type

  validates :number_of_purchased,
    presence: true,
    comparison: { greater_than_or_equal_to: 1 }
end
