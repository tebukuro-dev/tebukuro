json.extract! ticket_purchase, :id, :ticket_type_id, :number_of_purchased, :created_at, :updated_at
json.url ticket_purchase_url(ticket_purchase, format: :json)
