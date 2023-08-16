require 'rails_helper'

RSpec.describe "ticket_types/new", type: :view do
  let(:event) { Event.create!(name: 'Event name') }
  before(:each) do
    assign(:ticket_type, TicketType.new(
      name: "MyString",
      limit_number: 1,
      event: event,
    ))
  end

  it "renders new ticket_type form" do
    render

    assert_select "form[action=?][method=?]", event_ticket_types_path(event), "post" do

      assert_select "input[name=?]", "ticket_type[name]"

      assert_select "input[name=?]", "ticket_type[limit_number]"
    end
  end
end
