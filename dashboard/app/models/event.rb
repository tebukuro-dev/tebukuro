class Event < ApplicationRecord
  has_many :event_tickets
  has_many :ticket_types

  validates :name, presence: true
end
