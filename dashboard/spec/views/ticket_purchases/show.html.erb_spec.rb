require 'rails_helper'

RSpec.describe "ticket_purchases/show", type: :view do
  let(:ticket_type) {
    TicketType.create!(
      name: 'Ticket name',
      event: Event.create!(name: 'Event name'),
    )
  }

  before(:each) do
    assign(:ticket_purchase, TicketPurchase.create!(
      ticket_type: ticket_type,
      number_of_purchased: 2,
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(/2/)
  end
end
