require "rails_helper"

RSpec.describe EventTicketsController, type: :routing do
  describe "routing" do
    it "routes to #new" do
      expect(get: "/events/1/event_tickets/new").to route_to("event_tickets#new", event_id: "1")
    end

    it "routes to #edit" do
      expect(get: "/events/1/event_tickets/1/edit").to route_to("event_tickets#edit", id: "1", event_id: "1")
    end


    it "routes to #create" do
      expect(post: "/events/1/event_tickets").to route_to("event_tickets#create", event_id: "1")
    end

    it "routes to #update via PUT" do
      expect(put: "/events/1/event_tickets/1").to route_to("event_tickets#update", id: "1", event_id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/events/1/event_tickets/1").to route_to("event_tickets#update", id: "1", event_id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/events/1/event_tickets/1").to route_to("event_tickets#destroy", id: "1", event_id: "1")
    end
  end
end
