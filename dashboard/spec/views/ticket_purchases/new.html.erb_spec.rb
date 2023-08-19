require 'rails_helper'

RSpec.describe "ticket_purchases/new", type: :view do
  let(:event) { Event.create!(name: 'Event name') }
  let(:ticket_type) { TicketType.create!(name: 'Ticket name', event: event) }

  before(:each) do
    assign(:ticket_purchase, TicketPurchase.new(
      ticket_type: ticket_type,
      number_of_purchased: 1,
    ))
    assign(:event, event)
  end

  it "renders new ticket_purchase form" do
    render

    assert_select "form[action=?][method=?]", event_ticket_purchases_path(event), "post" do

      assert_select "select[name=?]", "ticket_purchase[ticket_type_id]"

      assert_select "input[name=?]", "ticket_purchase[number_of_purchased]"
    end
  end
end
