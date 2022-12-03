require 'rails_helper'

RSpec.describe "tickets/new", type: :view do
  before(:each) do
    assign(:ticket, Ticket.new(
      title: "MyString",
      description: "MyString"
    ))
  end

  it "renders new ticket form" do
    render

    assert_select "form[action=?][method=?]", tickets_path, "post" do

      assert_select "input[name=?]", "ticket[title]"

      assert_select "input[name=?]", "ticket[description]"
    end
  end
end
