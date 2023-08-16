class Event < ApplicationRecord
  has_many :event_tickets

  validates :name, presence: true
end
