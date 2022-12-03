require 'rails_helper'

RSpec.describe "tickets/index", type: :view do
  before(:each) do
    assign(:tickets, [
      Ticket.create!(
        title: "Title",
        description: "Description"
      ),
      Ticket.create!(
        title: "Title",
        description: "Description"
      )
    ])
  end

  it "renders a list of tickets" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new("Title".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Description".to_s), count: 2
  end
end
