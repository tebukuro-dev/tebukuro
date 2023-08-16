require 'rails_helper'

RSpec.describe "event_tickets/edit", type: :view do
  let(:event) { Event.create(name: 'Event name') }
  let(:event_ticket) {
    EventTicket.create!(
      name: "MyString",
      event: event,
    )
  }

  before(:each) do
    assign(:event_ticket, event_ticket)
  end

  it "renders the edit event_ticket form" do
    render

    assert_select "form[action=?][method=?]", event_event_ticket_path(event, event_ticket), "post" do

      assert_select "input[name=?]", "event_ticket[name]"
    end
  end
end
