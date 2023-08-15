require 'rails_helper'

RSpec.describe Event, type: :model do
  let(:event_name) { 'Event Name'}

  subject { described_class.new(name: event_name) }

  describe 'validations' do
    context 'when name is present' do
      it { is_expected.to be_valid }
    end

    context 'when name is not present' do
      let(:event_name) { '' }

      it { is_expected.to be_invalid }
    end
  end
end
