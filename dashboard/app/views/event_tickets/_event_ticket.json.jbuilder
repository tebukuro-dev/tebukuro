json.extract! event_ticket, :id, :name, :event_id, :created_at, :updated_at
json.url event_event_ticket_url([event, event_ticket], format: :json)
