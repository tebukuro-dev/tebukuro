require 'rails_helper'

RSpec.describe EventTicket, type: :model do
  let(:ticket_name) { 'Ticket Name'}
  let(:event) { Event.create(name: 'Event name') }

  subject { described_class.new(name: ticket_name, event: event) }

  describe 'validations' do
    context 'when name is present' do
      it { is_expected.to be_valid }
    end

    context 'when name is not present' do
      let(:ticket_name) { '' }

      it { is_expected.to be_invalid }
    end
  end
end
