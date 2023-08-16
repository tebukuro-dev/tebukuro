require 'rails_helper'

RSpec.describe "ticket_types/edit", type: :view do
  let(:event) { Event.create!(name: 'Event name') }
  let(:ticket_type) {
    TicketType.create!(
      name: "MyString",
      limit_number: 1,
      event: event,
    )
  }

  before(:each) do
    assign(:ticket_type, ticket_type)
  end

  it "renders the edit ticket_type form" do
    render

    assert_select "form[action=?][method=?]", event_ticket_type_path(event, ticket_type), "post" do

      assert_select "input[name=?]", "ticket_type[name]"

      assert_select "input[name=?]", "ticket_type[limit_number]"
    end
  end
end
