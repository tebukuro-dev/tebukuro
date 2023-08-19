require "rails_helper"

RSpec.describe TicketPurchasesController, type: :routing do
  describe "routing" do
    it "routes to #new" do
      expect(get: "/events/1/ticket_purchases/new").to route_to("ticket_purchases#new", event_id: "1")
    end

    it "routes to #show" do
      expect(get: "/events/1/ticket_purchases/1").to route_to("ticket_purchases#show", event_id: "1", id: "1")
    end

    it "routes to #create" do
      expect(post: "/events/1/ticket_purchases").to route_to("ticket_purchases#create", event_id: "1")
    end
  end
end
