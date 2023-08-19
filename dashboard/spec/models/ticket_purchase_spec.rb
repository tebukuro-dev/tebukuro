require 'rails_helper'

RSpec.describe TicketPurchase, type: :model do
  let(:number_of_purchased) { 1 }
  let(:ticket_type) { TicketType.create!(name: 'Ticket name', event: Event.create!(name: 'Event name')) }

  subject { described_class.new(ticket_type: ticket_type, number_of_purchased: number_of_purchased) }

  describe 'validations' do
    context 'when name is greater than or equal to 1' do
      it { is_expected.to be_valid }
    end

    context 'when name is less than 1' do
      let(:number_of_purchased) { 0 }

      it { is_expected.to be_invalid }
    end
  end
end
