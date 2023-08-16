require "rails_helper"

RSpec.describe TicketTypesController, type: :routing do
  describe "routing" do
    it "routes to #new" do
      expect(get: "/events/1/ticket_types/new").to route_to("ticket_types#new", event_id: "1")
    end

    it "routes to #edit" do
      expect(get: "/events/1/ticket_types/1/edit").to route_to("ticket_types#edit", id: "1", event_id: "1")
    end

    it "routes to #create" do
      expect(post: "/events/1/ticket_types").to route_to("ticket_types#create", event_id: "1")
    end

    it "routes to #update via PUT" do
      expect(put: "/events/1/ticket_types/1").to route_to("ticket_types#update", id: "1", event_id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/events/1/ticket_types/1").to route_to("ticket_types#update", id: "1", event_id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/events/1/ticket_types/1").to route_to("ticket_types#destroy", id: "1", event_id: "1")
    end
  end
end
