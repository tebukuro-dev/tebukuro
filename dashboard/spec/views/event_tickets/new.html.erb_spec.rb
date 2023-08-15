require 'rails_helper'

RSpec.describe "event_tickets/new", type: :view do
  let(:event) { Event.create(name: 'Event name') }
  before(:each) do
    assign(:event_ticket, EventTicket.new(
      name: "MyString",
      event: event,
    ))
  end

  it "renders new event_ticket form" do
    render

    assert_select "form[action=?][method=?]", event_event_tickets_path(event), "post" do

      assert_select "input[name=?]", "event_ticket[name]"
    end
  end
end
